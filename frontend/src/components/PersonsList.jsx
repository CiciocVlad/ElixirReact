import React, { useState } from 'react'
import Person from './Person'
import { motion } from 'framer-motion'
import '../css/style.css'
import { baseUrl } from './consts'

export default function PersonsList(props) {
	const [showDetails, setShowDetails] = useState(false)
	const [detailsFor, setDetailsFor] = useState(-1)
	const [pers, setPers] = useState({})
	const [loaded, setLoading] = useState(false)
	
	const getById = async id => {
		const response = await fetch(`${baseUrl}/api/persons/${id}`)
		const data = await response.json()
		return data
	}

	const renderCards = () => {
		return (
			<>
				<h2>Persons</h2>
				<div className="persons-container">
					{props.persons.map(person =>
						<motion.div
							key={person.id}
							initial={{ transform: 'scaleX(0)' }}
							animate={{ transform: 'scaleX(1)' }}
							transition={{ delay: 0.3 * person.id }}
						>
							<Person person={person} handleDetails={() => setShowDetails(true)} handleFor={x => setDetailsFor(x)} />
						</motion.div>
					)}
				</div>
			</>
		)
	}

	const renderDetails = () => {
		if (!loaded)
			getById(detailsFor).then(response => {
				setPers(response.data)
				setLoading(true)
			})

		return (
			<div className="details-container">
				<div className="left-side" style={{ backgroundImage: `url(${pers.avatar})` }}></div>
				<div className="right-side">
					<h2>{pers.name}</h2>
					<h2>{pers.role}</h2>
					<button onClick={() => {
						setShowDetails(false)
						setLoading(false)
					}}>Close Details</button>
				</div>
			</div>
		)
	}

	return !showDetails ? renderCards() : renderDetails()
}