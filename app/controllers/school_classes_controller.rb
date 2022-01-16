class SchoolClassesController < ApplicationController

    def index
        @school_classes = SchoolClass.all
    end

    def new
        @school_class = SchoolClass.new
    end

    def create
        @school_class = SchoolClass.create(school_params(:title,:room_number))
        redirect_to school_class_path(@school_class)
    end

    def show
        @school_class = find_class
    end

    def edit
        @school_class = find_class
    end

    def update
        @school_class= find_class
        @school_class.update(school_params(:title,:room_number))
        redirect_to school_class_path(@school_class)
    end

    private

    def school_params(*args)
        params.require(:school_class).permit(*args)
    end

    def find_class
        SchoolClass.find_by_id(params[:id])
    end
end