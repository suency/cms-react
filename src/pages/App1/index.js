import React, { useEffect, useState, useReducer } from "react";
export default function App1() {
    const [user, setUser] = useState({})
    //const [info, setInfo] = useState({})
    const [info, setInfo] = useReducer(reducer, { "com": <button onClick={changeClick}>{user.name}</button> })

    const [count] = useState(0);

    function reducer(state, action) {
        return {
            "com": <button onClick={changeClick}>{user.name}</button>
        }
    }
    function changeClick() {
        console.log(user);
    }
    //console.log("render");
    useEffect(() => {

        setUser((pre) => {
            return { "name": "fei", "age": 10 }
        })
        /* setInfo({
            "com": <button onClick={changeClick}>{user.name}</button>
        }) */

        //console.log(22);

        return () => {
            console.log("end");
        }
    }, [])
    return <>
        <h1>{info.com}</h1>
        <h1>{count}</h1>
        <button onClick={() => { console.log(user); setInfo(); }}>do</button>
    </>
}