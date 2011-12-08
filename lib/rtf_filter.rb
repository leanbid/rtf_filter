require "rtf_filter/version"

module RtfFilter
  def self.to_txt(filename, options={})
    allow_tags = options[:allow_tags] || false
    if  File.exist?(filename)
      txt = ""
    	IO.popen("rtffilter --source '"+filename+"' --toStdOut"+self.allow_tags(allow_tags)).each_line do |l|
        txt += l
      end
      self.format_txt(txt) if options[:format_txt]
      return txt
    else
    	print "Could not find file: "+filename
	  end  
  end

  def self.to_txt_file(filename, options={})
    destination_folder = options[:destination_folder] || ""
    allow_tags = options[:allow_tags] || false
    if  File.exist?(filename)
      unless destination_folder.empty?
        return (print "Could not find directory: #{destination_folder}") unless File.directory?(destinationFolder)
      end
      destination = destination_folder+"/"+filename.sub(/.{3}$/,'txt')
    	system("rtffilter --source '"+filename+"' --destination '"+destination+"'"+self.allow_tags(allow_tags))
    else
    	print "Could not find file: "+filename
	  end  
  end

  def self.allow_tags(yes)
    if yes
      " --allowTags"
    else
      ""
    end
  end

  def self.format_txt(txt)
    txt.squeeze!("\n") #replace all occurrences of 2 or more line breaks with just one
    txt.gsub!(/^\s+/, "") #delete leading whitespace (spaces/tabs/etc) from beginning of each line
  end

end
