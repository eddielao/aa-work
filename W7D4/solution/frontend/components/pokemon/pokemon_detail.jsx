import React from 'react';
import Item from '../items/item';

const PokemonDetail = ({ pokemonDetail, items, children }) => (
	<section className="pokemon-detail">
		<ul>
			<img src={pokemonDetail.image_url} alt={pokemonDetail.name}/>
				<li><h2>{pokemonDetail.name}</h2></li>
				<li>Type: {pokemonDetail.poke_type}</li>
				<li>Attack: {pokemonDetail.attack}</li>
				<li>Defense: {pokemonDetail.defense}</li>
				<li>Moves: {pokemonDetail.moves.join(', ')}</li>
		</ul>
		<section className="toys">
			<h3>Items</h3>
			<ul className="toy-list">
				{items.map((item) => <Item key={item.name} item={item}/>)}
			</ul>
		</section>
		{children}
	</section>
);

export default PokemonDetail;
