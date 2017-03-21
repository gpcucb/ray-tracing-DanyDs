#include "Render.h"


Render::Render()
{
}


Render::Render(float width, float height,float background_red,float background_green,float background_blue)
{
	 RGB bk_color(background_red,background_green,background_blue);
	this->width=width;
	this->height=height;
	this->background_color = bk_color;
	// @buffer = Array.new(@width) { Array.new(@height)}
	this->x_pos = 0;
	this->y_pos = 0;
	this->is_drawing = true;
}

Render::~Render()
{
}



void Render::reset(){
	this->x_pos = 0;
	this->y_pos = 0;
	this->is_drawing = true;
}

RGB Render::calculate_pixel(float i,float j){
	return RGB(0.0,0.0,0.0);
	//{red: 0.0, green: 0.0, blue: 0.0}
}

void  Render::render(string title, string file_name)
{
	/*
	glutInit
    glutInitDisplayMode GLUT_RGB | GLUT_SINGLE
    glutInitWindowSize @width, @height
    glutInitWindowPosition 10, 10
    @window = glutCreateWindow title
    glutDisplayFunc :draw_scene
    glutReshapeFunc :reshape
    glutIdleFunc :idle
    @file_name = file_name
    init_gl
    at_exit do
      puts 'Saving file'
      save_image(file_name)
    end
    glutMainLoop

		*/
}

void Render::init_gl(){
	/*
	 glClearColor @background_color[:red], @background_color[:green], @background_color[:blue], 0.0

	*/
}

void Render::draw_scene(){
	/*
	 glClear GL_COLOR_BUFFER_BIT
    glMatrixMode GL_PROJECTION
    glLoadIdentity
    glOrtho 0, @width, 0.0, @height, 1, -1
    glMatrixMode GL_MODELVIEW
    glLoadIdentity
    glBegin GL_POINTS
    (0...@width).each do |i|
      (0...@height).each do |j|
        if @buffer[i][j].nil?
          glColor3f @background_color[:red], @background_color[:green], @background_color[:blue]
        else
          glColor3f @buffer[i][j][:red], @buffer[i][j][:green], @buffer[i][j][:blue]
        end
        glVertex2i i, j
      end
    end
    glEnd
    glFlush

	*/
}

void Render::reshape(float width, float height){
	this->width = width;
	this->height = height;
}
void Render::idle(){
	/*
	if @is_drawing
      @buffer[@x_pos][@y_pos] = calculate_pixel(@x_pos, @y_pos)
      @x_pos += 1

      if @x_pos >= @width
        @x_pos = 0
        @y_pos += 1
        glutPostRedisplay
      end

      if @y_pos >= @height
        @is_drawing = false
        glutPostRedisplay
      end
    end

	*/
}

void Render::save_image(string file_name){
	/*
	 png = ChunkyPNG::Image.new(@width, @height, ChunkyPNG::Color::TRANSPARENT)
    (0...@width).each do |i|
      (0...@height).each do |j|
        if @buffer[i][j].nil?
          png[i, j] = ChunkyPNG::Color.rgb((@background_color[:red] * 255).to_i,
                                           (@background_color[:green] * 255).to_i,
                                           (@background_color[:blue] * 255).to_i)
        else
          png[i, j] = ChunkyPNG::Color.rgb((@buffer[i][j][:red] * 255).to_i,
                                           (@buffer[i][j][:green] * 255).to_i,
                                           (@buffer[i][j][:blue] * 255).to_i)
        end
      end
    end
    png.save(file_name, :interlace => true)
  end


	*/
}