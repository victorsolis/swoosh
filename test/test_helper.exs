ExUnit.start()
ExUnit.configure(exclude: :external)

Application.ensure_all_started(:bypass)
