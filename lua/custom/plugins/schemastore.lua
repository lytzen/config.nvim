return {
  'b0o/schemastore.nvim',
  lazy = true,

  config = function()
    -- Setup for json
    require('lspconfig').jsonls.setup {
      settings = {
        json = {
          schemas = require('schemastore').json.schemas {
            extra = {
              {
                description = 'TERMA ADLS Site Config',
                FileMatch = 'site_config.json',
                name = 'site_config.json',
                url = '/home/mlh/projects/lcs/salic/config/src/main/schemas/site_config_schema.json',
              },
            },
          },
          validate = { enable = true },
        },
      },
    }

    -- Setup for yaml
    require('lspconfig').yamlls.setup {
      settings = {
        yaml = {
          schemastore = {
            -- You must disable built-in schemaStore support if you want to
            -- use this plugin and its advanced options like 'ignore'
            enable = false,
            -- Avoid TypeError: Cannot read properties of undefined (reading 'length ')
            url = '',
          },
          schemas = require('schemastore').yaml.schemas(),
        },
      },
    }
  end,
}
