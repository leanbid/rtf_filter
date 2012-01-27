require "rtf_filter/version"

module RtfFilter
  def self.to_txt(filename, options={})
    allow_tags = options[:allow_tags] || false
    begin
      txt = ""
    	IO.popen("rtffilter --source '"+filename+"' --toStdOut"+self.allow_tags(allow_tags)).each_line do |l|
        txt += l
      end
      self.format_txt(txt) if options[:format_txt]
      raise IOError if txt == ""
      return txt
    rescue IOError => e 
      if options[:io_exception]
        raise e
      else
    	  return nil
      end
    end
  end

  def self.to_txt_file(filename, options={})
    destination_folder = options[:destination_folder] || ""
    allow_tags = options[:allow_tags] || false
    begin
      destination_folder += "/"unless destination_folder.empty?
      destination = destination_folder + filename.sub(/.{3}$/,'txt')
      txt = self.to_txt(filename, options)
      File.open(destination, 'w') {|f| f.write(txt)}
    rescue IOError => e 
      if options[:io_exception]
        raise e
      else
    	  return nil
      end
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
    txt.strip! #remove blank lines at begining and end
    txt.gsub!(/(^|\n)[ \t\r]+/, "\\1") #delete leading whitespace (spaces/tabs) from beginning of each line
    txt.gsub!(/\n{3,}/, "\n\n") #replace all occurrences of 3 or more line breaks with just two
    return txt
  end

end
