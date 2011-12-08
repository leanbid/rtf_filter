require "rtf_filter/version"

module RtfFilter
  def self.to_txt(filename, options={})
    allow_tags = options[:allow_tags] || false
    puts allow_tags
    if  File.exist?(filename)
      txt = ""
    	IO.popen("rtffilter --source '"+filename+"' --toStdOut"+self.allow_tags(allow_tags)).each_line do |l|
        txt += l
      end
      return txt
    else
    	print "Could not find file: "+filename
	  end  
  end

  def self.to_txt_file(filename, destinationFolder="", allow_tags=false)
    if  File.exist?(filename)
      unless destinationFolder.empty?
        return (print "Could not find directory: #{destinationFolder}") unless File.directory?(destinationFolder)
      end
      destination = destinationFolder+"/"+filename.sub(/.{3}$/,'txt')
      puts "Allow tags param #{self.allow_tags(allow_tags)}" #TODO REMOVE
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

end
