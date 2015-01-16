defmodule EXNN.DSL do

  defmacro extend_struct struct_mod, keyword do
    quote do
      defstruct Keyword.merge(  Map.to_list(Map.from_struct(unquote(struct_mod).__struct__)), unquote(keyword))
    end
  end

  defmacro set_initial_pattern(pattern) do
    quote do
      # Module.put_attribute(__MODULE__, :init_pattern, unquote(pattern))
      @initial_pattern unquote(pattern)
    end
  end

  defmacro set_sensor(name, mod, options) do
    quote do
      @nodes {:sensor, unquote(name), unquote(mod), unquote(options)}
    end
  end

  defmacro set_actuator(name, mod) do
    quote do
      @nodes {:actuator, unquote(name), unquote(mod)}
    end
  end

end