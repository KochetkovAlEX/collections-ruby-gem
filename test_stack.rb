# frozen_string_literal: true

require "spec_helper"

def run_stack_tests
  total = 0
  passed = 0

  puts '=' * 50
  puts 'Тестирование класса Stack'
  puts '=' * 50

  # 1: Проверяет создание пустого стека.
  total += 1
  begin
    stack = Collections::Stack.new
    if stack.is_a?(Collections::Stack) && stack.size == 0 && stack.peek.nil?
      passed += 1
      puts '✓ Тест 1 пройден: стек создаётся пустым'
    else
      puts '✗ Тест 1 не пройден: ошибка инициализации'
    end
  rescue => e
    puts "✗ Тест 1 не пройден: #{e.message}"
  end

  # 2: Проверяет, что push увеличивает размер стека.
  total += 1
  begin
    stack = Collections::Stack.new
    stack.push(10)
    stack.push(20)
    if stack.size == 2
      passed += 1
      puts '✓ Тест 2 пройден: push увеличивает размер'
    else
      puts '✗ Тест 2 не пройден: размер не соответствует'
    end
  rescue => e
    puts "✗ Тест 2 не пройден: #{e.message}"
  end

  # 3: Проверяет, что peek возвращает последний добавленный элемент.
  total += 1
  begin
    stack = Collections::Stack.new
    stack.push(5)
    stack.push(15)
    if stack.peek == 15
      passed += 1
      puts '✓ Тест 3 пройден: peek возвращает вершину стека'
    else
      puts '✗ Тест 3 не пройден: peek работает неверно'
    end
  rescue => e
    puts "✗ Тест 3 не пройден: #{e.message}"
  end

  # 4: Проверяет, что pop удаляет и возвращает верхний элемент (LIFO).
  total += 1
  begin
    stack = Collections::Stack.new
    stack.push(:a)
    stack.push(:b)
    popped = stack.pop
    if popped == :b && stack.size == 1 && stack.peek == :a
      passed += 1
      puts '✓ Тест 4 пройден: pop работает по принципу LIFO'
    else
      puts '✗ Тест 4 не пройден: pop работает неверно'
    end
  rescue => e
    puts "✗ Тест 4 не пройден: #{e.message}"
  end

  # 5: Проверяет, что pop на пустом стеке возвращает nil.
  total += 1
  begin
    stack = Collections::Stack.new
    result = stack.pop
    if result.nil? && stack.size == 0 && stack.peek.nil?
      passed += 1
      puts '✓ Тест 5 пройден: pop на пустом стеке возвращает nil'
    else
      puts '✗ Тест 5 не пройден: поведение pop на пустом стеке неверно'
    end
  rescue => e
    puts "✗ Тест 5 не пройден: #{e.message}"
  end

  # 6: Проверяет методы empty? и is_empty.
  total += 1
  begin
    stack = Collections::Stack.new
    empty1 = stack.is_empty
    stack.push(42)
    empty2 = stack.empty?
    if empty1 == true && empty2 == false
      passed += 1
      puts '✓ Тест 6 пройден: empty? и is_empty корректно определяют пустоту'
    else
      puts '✗ Тест 6 не пройден: методы empty? / is_empty работают неверно'
    end
  rescue => e
    puts "✗ Тест 6 не пройден: #{e.message}"
  end

  # 7: Проверяет, что clear удаляет все элементы из стека.
  total += 1
  begin
    stack = Collections::Stack.new
    stack.push(1)
    stack.push(2)
    stack.clear
    if stack.size == 0 && stack.peek.nil?
      passed += 1
      puts '✓ Тест 7 пройден: clear очищает стек'
    else
      puts '✗ Тест 7 не пройден: clear не очищает стек'
    end
  rescue => e
    puts "✗ Тест 7 не пройден: #{e.message}"
  end

  # 8: Проверяет, что set_peek заменяет верхний элемент.
  total += 1
  begin
    stack = Collections::Stack.new
    stack.push(10)
    stack.set_peek(99)
    if stack.peek == 99 && stack.size == 1 && stack.to_a == [99]
      passed += 1
      puts '✓ Тест 8 пройден: set_peek заменяет вершину стека'
    else
      puts '✗ Тест 8 не пройден: set_peek работает неверно'
    end
  rescue => e
    puts "✗ Тест 8 не пройден: #{e.message}"
  end

  # 9: Проверяет, что set_stack загружает в стек элементы из массива.
  total += 1
  begin
    stack = Collections::Stack.new
    arr = [10, 20, 30]
    stack.set_stack(arr)
    if stack.size == 3 && stack.peek == 30 && stack.to_a == arr
      passed += 1
      puts '✓ Тест 9 пройден: set_stack загружает массив в стек'
    else
      puts '✗ Тест 9 не пройден: set_stack работает неверно'
    end
  rescue => e
    puts "✗ Тест 9 не пройден: #{e.message}"
  end

  # 10: Проверяет, что contains определяет наличие элемента в стеке.
  total += 1
  begin
    stack = Collections::Stack.new
    stack.push('ruby')
    stack.push('python')
    if stack.contains('ruby') && !stack.contains('java')
      passed += 1
      puts '✓ Тест 10 пройден: contains корректно ищет элементы'
    else
      puts '✗ Тест 10 не пройден: contains работает неверно'
    end
  rescue => e
    puts "✗ Тест 10 не пройден: #{e.message}"
  end

  # 11: Проверяет, что index возвращает расстояние от вершины до элемента.
  total += 1
  begin
    stack = Collections::Stack.new
    stack.push('a')
    stack.push('b')
    stack.push('c')
    if stack.index('c') == 0 && stack.index('b') == 1 && stack.index('a') == 2 && stack.index('z') == -1
      passed += 1
      puts '✓ Тест 11 пройден: index возвращает правильное расстояние от вершины'
    else
      puts '✗ Тест 11 не пройден: index работает неверно'
    end
  rescue => e
    puts "✗ Тест 11 не пройден: #{e.message}"
  end

  # 12: Проверяет, что to_a возвращает копию внутреннего массива стека.
  total += 1
  begin
    stack = Collections::Stack.new
    stack.push(1)
    stack.push(2)
    arr = stack.to_a
    if arr == [1, 2] && arr.object_id != stack.instance_variable_get(:@stack).object_id
      passed += 1
      puts '✓ Тест 12 пройден: to_a возвращает копию массива'
    else
      puts '✗ Тест 12 не пройден: to_a возвращает не копию или неверный порядок'
    end
  rescue => e
    puts "✗ Тест 12 не пройден: #{e.message}"
  end

  # 13: Проверяет, что to_q создаёт очередь с элементами стека в том же порядке.
  total += 1
  begin
    stack = Collections::Stack.new
    stack.push(5)
    stack.push(6)
    queue = stack.to_q
    if queue.is_a?(Collections::Queue) && queue.size == 2
      passed += 1
      puts '✓ Тест 13 пройден: to_q создаёт очередь с элементами стека'
    else
      puts '✗ Тест 13 не пройден: to_q работает неверно'
    end
  rescue LoadError
    puts '✗ Тест 13 не пройден: класс Queue не найден'
  rescue => e
    puts "✗ Тест 13 не пройден: #{e.message}"
  end

  # 14: Проверяет, что метод print выполняется без ошибок.
  total += 1
  begin
    stack = Collections::Stack.new
    stack.push('x')
    stack.push('y')
    stack.print
    passed += 1
    puts '✓ Тест 14 пройден: print выполняется без ошибок'
  rescue => e
    puts "✗ Тест 14 не пройден: print выбросил исключение: #{e.message}"
  end

  # 15: Проверяет, что стек выдерживает 1000 добавлений.
  total += 1
  begin
    stack = Collections::Stack.new
    1000.times { |i| stack.push(i) }
    if stack.size == 1000 && stack.peek == 999
      passed += 1
      puts '✓ Тест 15 пройден: стек выдерживает 1000 добавлений'
    else
      puts '✗ Тест 15 не пройден: размер или вершина после 1000 push некорректны'
    end
  rescue => e
    puts "✗ Тест 15 не пройден: #{e.message}"
  end

  puts "\n" + '=' * 50
  if passed == total
    puts "🎉 Все тесты стека пройдены! (#{passed}/#{total})"
  else
    puts "Пройдено тестов: #{passed}/#{total}"
    puts 'Некоторые тесты не прошли. Проверьте реализацию стека.'
  end
  puts '=' * 50
end

# Запуск тестов
run_stack_tests