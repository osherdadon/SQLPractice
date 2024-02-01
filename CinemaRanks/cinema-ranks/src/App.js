import React from "react";
import './App.css'
import SearchIcon from './search.svg'
import { useState, useEffect } from "react";
import MovieCard from "./Components/MovieCard";


const API_KEY = '4a77709e';
const API_URL = `http://www.omdbapi.com?apikey=${API_KEY}`;


const App = () => {
  const [searchTerm, setSearchTerm] = useState('');
  const [movies,setMovies] = useState([]);
  const searchMovies = async (title) => {
      if(title === ''){
        title = 'abc';
      }
      const response = await fetch(`${API_URL}&s=${title}`);
      const data = await response.json();
      setMovies(data.Search);
  }

  useEffect(() => {
    searchMovies('');
  },[]);

  return(
    <div className="app">
        <h1>CinemaRanks</h1>
        <div className="search">
          <input placeholder="Search for movies.." value={searchTerm} onChange={(e) => {setSearchTerm(e.target.value)}}></input>
          <img src={SearchIcon} alt="Search" onClick={() => searchMovies(searchTerm)}/>
        </div>
          {
            movies?.length > 0 ?
            <div className="container">
             {
              movies.map((movie) => (
                <MovieCard movie={movie} />
              ))
             }
            </div>
            :
            <div className="empty">
                <h3>No movies here... </h3>
            </div>
          }
        </div>
  );
}

export default App;