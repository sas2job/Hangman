# encoding: utf-8
#
# Класс WordReader, отвечающий за чтение слова для игры.
class WordReader

  def read_from_args
    return ARGV[0].downcase
  end

  def read_from_file(file_name)
    # Если файла не существует, сразу выходим из метода
    if !File.exist?(file_name)
      return nil
    end

    file = File.new(file_name, "r:UTF-8")
    lines = file.readlines
    file.close

    return lines.sample.strip
  end
end
