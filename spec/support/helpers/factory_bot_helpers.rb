module FactoryBotHelpers
  extend self

  def subir_archivo(**args)
    Rack::Test::UploadedFile.new(
      Rails.root.join("spec/fixtures/files/#{args[:nombre]}"), "image/#{args[:formato]}"
    )
  end
end
