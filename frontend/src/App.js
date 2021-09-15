import React, { useEffect, useState } from 'react'
import './App.css'
import { baseUrl } from './components/consts'
import PersonsList from './components/PersonsList'

export default function App() {
	const [persons, setPersons] = useState([])
	const [loading, setLoading] = useState(true)

	const getPersons = async () => {
		const response = await fetch(`${baseUrl}/api/persons`)
		const data = await response.json()
		setPersons(data)
		setLoading(false)
	}

	useEffect(() => {
		getPersons()
	}, [])

	return (
		<div className="App">
			{!loading && <PersonsList persons={persons.data} />}
		</div>
	)
}
