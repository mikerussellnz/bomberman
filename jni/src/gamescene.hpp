#pragma once

#include "scene_interface.hpp"
#include "map.hpp"

#include <SDL.h>
#include <SDL_ttf.h>
#include <SDL_mixer.h>

#include <string>
#include <memory>
#include <list>
#include <array>
#include <map>

#include <boost/circular_buffer.hpp>
#include "player.hpp"

namespace bomberman {
	
struct PlayerConfig
{
	bool present;
	std::string spriteName;
	std::string name;
};

typedef std::array<PlayerConfig, 4> PlayerConfigArray;

class GameScene : public SceneInterface
{

	public:
		GameScene(const PlayerConfigArray &playerConfig);
		virtual ~GameScene() {}
		virtual void Init(SDL_Window* window, SDL_Renderer* renderer);
		virtual void Update(const std::vector<InputState>& inputs, uint32_t timestamp);
		virtual void Render(SDL_Renderer *renderer);
		virtual bool Running();
		
		void BackThroughTime(SDL_Renderer *renderer, uint32_t now);

		int GetVictor() const { return _victor; }

	private:
		std::shared_ptr<Mix_Music> _music;
		std::shared_ptr<SDL_Texture> _texture;
		MapPtr _presentMap;

		boost::circular_buffer<std::pair<uint32_t, MapPtr>> _pastMaps;
		PlayerConfigArray _playerConfig;

		bool _running;
		int _victor;
};

}