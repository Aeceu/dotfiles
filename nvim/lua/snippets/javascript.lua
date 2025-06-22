local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- console.log()
  s("clg", {
    t("console.log("),
    i(1),
    t(");"),
  }),

  -- useState hook
  s("us", {
    t("const ["),
    i(1, "state"),
    t(", "),
    i(2, "setState"),
    t("] = useState("),
    i(3, "initialValue"),
    t(");"),
  }),

  -- useEffect hook
  s("uef", {
    t("useEffect(() => {"),
    t({ "", "  " }),
    i(1, "// effect"),
    t({ "", "}, [" }),
    i(2),
    t("]);"),
  }),

  -- function declaration
  s("fn", {
    t("function "),
    i(1, "name"),
    t("("),
    i(2),
    t(") {"),
    t({ "", "  " }),
    i(3),
    t({ "", "}" }),
  }),

  -- export function declaration
  s("efn", {
    t("export function "),
    i(1, "name"),
    t("("),
    i(2),
    t(") {"),
    t({ "", "  " }),
    i(3),
    t({ "", "}" }),
  }),

  -- arrow function
  s("afn", {
    t("const "),
    i(1, "name"),
    t(" = ("),
    i(2),
    t(") => {"),
    t({ "", "  " }),
    i(3),
    t({ "", "};" }),
  }),

  -- export  arrow function
  s("eafn", {
    t("export const "),
    i(1, "name"),
    t(" = ("),
    i(2),
    t(") => {"),
    t({ "", "  " }),
    i(3),
    t({ "", "};" }),
  }),

  -- async arrow function
  s("aafn", {
    t("const "),
    i(1, "name"),
    t(" = async ("),
    i(2),
    t(") => {"),
    t({ "", "  " }),
    i(3),
    t({ "", "};" }),
  }),

  -- export async arrow function
  s("eaafn", {
    t("export const "),
    i(1, "name"),
    t(" = async ("),
    i(2),
    t(") => {"),
    t({ "", "  " }),
    i(3),
    t({ "", "};" }),
  }),
}
