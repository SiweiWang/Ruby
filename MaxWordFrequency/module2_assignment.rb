class LineAnalyzer
  #* highest_wf_count - a number with maximum number of occurrences for a single word (calculated)
  #* highest_wf_words - an array of words with the maximum number of occurrences (calculated)
  #* content          - the string analyzed (provided)
  #* line_number      - the line number analyzed (provided)
  attr_reader :highest_wf_words
  attr_reader :highest_wf_count
  attr_reader :content
  attr_reader :line_number
  attr_reader :word_frequency

  #* take in a line of text and line number
  #* initialize the content and line_number attributes
  #* call the calculate_word_frequency() method.
  def initialize (content, line_number)
    @content = content
    @line_number = line_number
    @highest_wf_count = 0
    @highest_wf_words = Array.new()
    calculate_word_frequency()
    unless @word_frequency.nil?
      @word_frequency.each do | key, value |
        if value == @highest_wf_count
          @highest_wf_words.push(key)
        end
      end
    end
  end

  #* calculate the maximum number of times a single word appears within
  #  provided content and store that in the highest_wf_count attribute.
  #* identify the words that were used the maximum number of times and
  #  store that in the highest_wf_words attribute.
  def calculate_word_frequency ()
    @word_frequency = Hash.new(0)
    @content.split.each do |word|
      @word_frequency[word.downcase] += 1
      if @highest_wf_count < @word_frequency[word.downcase]
        @highest_wf_count = @word_frequency[word.downcase]
      end
    end
  end
end

class Solution

  #* analyzers - an array of LineAnalyzer objects for each line in the file
  #* highest_count_across_lines - a number with the maximum value for highest_wf_words attribute in the analyzers array.
  #* highest_count_words_across_lines - a filtered array of LineAnalyzer objects with the highest_wf_words attribute 
  #  equal to the highest_count_across_lines determined previously.
  attr_reader :analyzers
  attr_reader :highest_count_across_lines
  attr_reader :highest_count_words_across_lines

  def initialize ()
    @analyzers = Array.new()
  end

  # Implement the analyze_file() method() to:
  #* Read the 'test.txt' file in lines 
  #* Create an array of LineAnalyzers for each line in the file
  def analyze_file()
    @analyzers = Array.new()
    line_number = 1
    if File.exist?'test.txt'
      File.foreach ('test.txt') do | line |
        analyzer = LineAnalyzer.new(line.chomp, line_number)
        line_number += 1
        @analyzers.push(analyzer)
      end
    end
  end

  #* calculate the maximum value for highest_wf_count contained by the LineAnalyzer objects in analyzers array
  #  and stores this result in the highest_count_across_lines attribute.
  #* identifies the LineAnalyzer objects in the analyzers array that have highest_wf_count equal to highest_count_across_lines 
  #  attribute value determined previously and stores them in highest_count_words_across_lines.
  def calculate_line_with_highest_frequency()
    @highest_count_across_lines = 0
    @analyzers.each do | analyzer |
      if analyzer.highest_wf_count > @highest_count_across_lines
        @highest_count_across_lines = analyzer.highest_wf_count
      end
    end
    @highest_count_words_across_lines = @analyzers.select { |element| element.highest_wf_count == @highest_count_across_lines }
  end

  #* print the values of objects in highest_count_words_across_lines in the specified format
  def print_highest_word_frequency_across_lines()
    p "The following words have the highest word frequency per line:"
    @highest_count_words_across_lines.each do | element |
      p "#{element.highest_wf_words} (appears in line#{element.line_number})"
    end
  end
end