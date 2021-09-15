import React from 'react'
import '../css/style.css'

export default function Person(props) {
	return (
		<div className="card" style={{ backgroundImage: `url(${props.person.avatar})` }}>
			<div className="card-content">
				<h2 className="card-title">{props.person.name}</h2>
				<p className="card-info">{props.person.role}</p>
				<button className="button" onClick={() => {
					props.handleDetails()
					props.handleFor(props.person.id)
				}}>Learn more</button>
			</div>
		</div>
	)
}