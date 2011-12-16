require 'test/unit'
require 'rtf_filter'

class RtfFilterTest < Test::Unit::TestCase

  def test_should_convert_rtf_to_txt
	assert_equal RtfFilter.to_txt('test/test_rtf_file.rtf'), "\n\n\n\n\n\n\n\n\n\ntest line 1\n \n test line 2\n \n test line 3\n "
  end

  def test_should_convert_rtf_to_txt_and_format_text
	assert_equal RtfFilter.to_txt('test/test_rtf_file.rtf', :format_txt => true), "test line 1\n\ntest line 2\n\ntest line 3"
  end

  def test_should_convert_rtf_file_to_txt_file
	RtfFilter.to_txt_file('test/test_rtf_file.rtf', :format_txt => true)
	assert File.exist?('test/test_rtf_file.txt')
	`rm test/test_rtf_file.txt`
  end

  def test_format_txt_should_take_out_extra_blank_lines_in_text
	text = "l1\n\n\nl2\n\n\n\n\nL3\n\n\n\n\n\n\n\n\nL5\n\n\nL6"
	assert_equal RtfFilter.format_txt(text), "l1\\n\\nl2\\n\\nL3\\n\\nL5\\n\\nL6" 
	text = "l1\n\n\nl2\n\n  \n\n  \nL3\n\n\n\n \n\n\n\n\nL5\n\n\nL6"
	assert_equal RtfFilter.format_txt(text), "l1\\n\\nl2\\n\\nL3\\n\\nL5\\n\\nL6" 
  end

  def test_format_txt_should_take_out_blank_lines_at_begining_and_end_of_text
	text = "\n\n\nl1\n\nl2\n\n"
	assert_equal RtfFilter.format_txt(text), "l1\n\nl2" 
  end

  def test_format_txt_should_align_text_to_left
	text = "l1\n\n  l2 content"
	assert_equal "l1\n\nl2 content", RtfFilter.format_txt(text)
  end

end
