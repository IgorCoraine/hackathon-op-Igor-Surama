const { createHelia } = require('helia');
const { json } = require('@helia/json');
const fs = require('fs').promises; 

// Function to create NFT URI
async function createNFTuri(_jsonPath) {
    try {
        // Load JSON data from the file
        const jsonData = await loadJsonData(_jsonPath);
        
        // Create Helia instance and add JSON data
        const helia = await createHelia();
        const j = json(helia);
        const NFTdataAddress = await j.add(jsonData);
        
        return NFTdataAddress;
    } catch (error) {
        console.error('Error creating NFT URI:', error);
    }
}

// Function to get NFT data
async function getNFTdata(_NFTuri) {
    try {
        // Create Helia instance and retrieve NFT data
        const helia = await createHelia();
        const j = json(helia);
        const retrievedObject = await j.get(_NFTuri);
        
        return retrievedObject;
    } catch (error) {
        console.error('Error retrieving NFT data:', error);
    }
}

// Function to load JSON data from a file
async function loadJsonData(jsonPath) {
    try {
        // Read JSON data from the file
        const jsonData = await fs.readFile(jsonPath, 'utf-8');
        
        // Parse JSON data
        return JSON.parse(jsonData);
    } catch (error) {
        throw new Error('Error loading JSON data:', error);
    }
}
