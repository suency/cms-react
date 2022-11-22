import DefaultPage from "@/pages/DefaultPage"

const DynComp = ({ Obj, name }) => {
  const ObjComponent = Obj[name]

  if (!ObjComponent) { // Return a default unconfigure page
    return <DefaultPage />
  }

  return <ObjComponent />
}

export default DynComp