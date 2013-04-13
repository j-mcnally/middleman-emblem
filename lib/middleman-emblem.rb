require "middleman-emblem/version"


::Middleman::Extensions.register(:emblem) do
  require "middleman-emblem/extension"
  ::Middleman::Emblem
end