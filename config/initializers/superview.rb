# Superview's components and helpers are written against Phlex, but the gem
# does not depend on phlex, so eager loading (production and CI) fails with
# "uninitialized constant Superview::Components::Phlex". Keep the gem out of
# eager loading; its constants remain autoloadable on demand.
Superview::Loader.do_not_eager_load(Superview::Loader.dirs.first)
