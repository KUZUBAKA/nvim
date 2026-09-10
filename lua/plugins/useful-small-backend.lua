return {
 {
  -- TABキーを押した際に自動でその行に合ったインデントを入れる
  'vidocqh/auto-indent.nvim',
  opts = {
   key = "<TAB>",
  },
 },
 {
  -- nvimを開いた場所の流れにあるフォルダーが存在しなくても自動で作成してくれる
  "jghauser/mkdir.nvim",
  config = function()
   require("mkdir").run()
  end
 }
}
