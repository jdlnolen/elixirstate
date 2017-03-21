defmodule Ping do
  def start do
    loop(0)
  end

  def loop(count) do
    receive do
      {:pong, from} ->
        IO.puts "ping -> " <> Integer.to_string(count)
        :timer.sleep 500
        send(from, {:ping, self()})
      {:ping, from} ->
        IO.puts "            <- pong " <> Integer.to_string(count)
        :timer.sleep 500
        send(from, {:pong, self()})
      {:read, from} ->
        IO.puts "got the read"
    end 
    loop(count+1)
  end
end

