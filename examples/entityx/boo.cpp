#include <entityx/entityx.h>

int main() {
    entityx::EntityX ex;
    entityx::Entity entity = ex.entities.create();
    entity.destroy();
}
