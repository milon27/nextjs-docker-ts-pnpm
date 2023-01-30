'use client'
import React from 'react'

export default function Test() {

    console.log("CLIENT NEXT_PUBLIC_API=", process.env.NEXT_PUBLIC_API);
    console.log("CLIENT SOME_SECRET_ENV=", process.env.SOME_SECRET_ENV);

    return (
        <div>

            test

            <p>
                LOAD PUBLIC DATA FROM ENV:
                <code >{process.env.NEXT_PUBLIC_API}</code>
            </p>
        </div>
    )
}
