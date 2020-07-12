namespace :api do
  desc 'Build API documentation'
  task :docs do
    input_file = 'docs/api/documentation.md'
    output_file = 'public/documentation.html'
    system(" bin/yarn run aglio -i #{input_file}  -o #{output_file}")
  end
end
