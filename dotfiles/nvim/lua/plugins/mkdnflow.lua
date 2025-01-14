if 1 == 1 then
    return {}
end
return {
    'jakewvincent/mkdnflow.nvim',
    config = function()
        require('mkdnflow').setup({})
    end,
}
