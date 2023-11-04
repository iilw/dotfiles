local status, illuminate = pcall(require, 'illuminate')
if(not status) then return end

illuminate.configure({
  delay = 200,
  large_file_cutoff = 2000,
  under_cursor = false,
  providers = {
    'lsp'
  }
})
