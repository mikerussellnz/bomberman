#ifndef BOMB_HPP
#define BOMB_HPP

#include "entity.hpp"

// STL - libstdc++
#include <memory>

struct SDL_Texture;

namespace bomberman {
namespace arsenal {

	class Bomb;
	typedef std::shared_ptr<Bomb> BombPtr;

	class Bomb : public Entity {
		public:
			static BombPtr Create(int iTimeout, int iStrength);
			virtual void Render(SDL_Renderer*) const;
		private:
			int _timeout;
			int _strength; // In megaton
			static void InitializeGraphicRessources(SDL_Renderer *iRenderer);
			static std::shared_ptr<SDL_Texture> _Bomb;
	};
}
}

#endif