fizzbuzz = fn
  (0,0,_) -> IO.puts "FizzBuzz"
  (0,_,_) -> IO.puts "Fizz"
  (_,0,_) -> IO.puts "Buzz"
  (_,_,x) -> IO.puts x
end

run_fb = fn (x) -> fizzbuzz.(rem(x,3), rem(x,5), x) end

run_fb.(10)
run_fb.(11)
run_fb.(12)
run_fb.(13)
run_fb.(14)
run_fb.(15)
run_fb.(16)
