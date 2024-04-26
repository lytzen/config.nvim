return {
  'b0o/schemastore.nvim',

  config = function()
    -- Setup for json
    require('lspconfig').jsonls.setup {
      settings = {
        json = {
          schemas = require('schemastore').json.schemas {
            extras = {
              {
                description = 'TERMA SALIC site config JSON schema',
                fileMatch = 'site_config.json',
                name = 'site_config_schema.json',
                url = 'file:///Users/mlh/work/lcs/salic/config/src/main/schemas/site_config_schema.json',
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
