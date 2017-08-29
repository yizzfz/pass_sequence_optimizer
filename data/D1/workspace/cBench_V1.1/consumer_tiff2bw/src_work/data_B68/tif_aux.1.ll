; ModuleID = 'tif_aux.ll'
source_filename = "tif_aux.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, {}*, {}*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFVGetFieldDefaulted(%struct.tiff*, i32, %struct.__va_list_tag*) local_unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6
  %5 = tail call i32 @TIFFVGetField(%struct.tiff* %0, i32 %1, %struct.__va_list_tag* %2) #2
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %594

; <label>:7:                                      ; preds = %3
  switch i32 %1, label %594 [
    i32 254, label %8
    i32 258, label %27
    i32 263, label %46
    i32 266, label %65
    i32 274, label %84
    i32 277, label %103
    i32 278, label %122
    i32 280, label %141
    i32 281, label %160
    i32 284, label %179
    i32 296, label %198
    i32 336, label %217
    i32 332, label %255
    i32 334, label %274
    i32 338, label %293
    i32 32995, label %330
    i32 32998, label %358
    i32 32996, label %377
    i32 32997, label %397
    i32 529, label %416
    i32 530, label %446
    i32 531, label %482
    i32 301, label %501
    i32 532, label %570
  ]

; <label>:8:                                      ; preds = %7
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 7
  %10 = load i32, i32* %9, align 8
  %11 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %12 = load i32, i32* %11, align 8
  %13 = icmp ult i32 %12, 41
  br i1 %13, label %14, label %20

; <label>:14:                                     ; preds = %8
  %15 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %16 = load i8*, i8** %15, align 8
  %17 = sext i32 %12 to i64
  %18 = getelementptr i8, i8* %16, i64 %17
  %19 = add i32 %12, 8
  store i32 %19, i32* %11, align 8
  br label %24

; <label>:20:                                     ; preds = %8
  %21 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %22 = load i8*, i8** %21, align 8
  %23 = getelementptr i8, i8* %22, i64 8
  store i8* %23, i8** %21, align 8
  br label %24

; <label>:24:                                     ; preds = %20, %14
  %.in28 = phi i8* [ %18, %14 ], [ %22, %20 ]
  %25 = bitcast i8* %.in28 to i32**
  %26 = load i32*, i32** %25, align 8
  store i32 %10, i32* %26, align 4
  br label %594

; <label>:27:                                     ; preds = %7
  %28 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 8
  %29 = load i16, i16* %28, align 4
  %30 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %31 = load i32, i32* %30, align 8
  %32 = icmp ult i32 %31, 41
  br i1 %32, label %33, label %39

; <label>:33:                                     ; preds = %27
  %34 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %35 = load i8*, i8** %34, align 8
  %36 = sext i32 %31 to i64
  %37 = getelementptr i8, i8* %35, i64 %36
  %38 = add i32 %31, 8
  store i32 %38, i32* %30, align 8
  br label %43

; <label>:39:                                     ; preds = %27
  %40 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %41 = load i8*, i8** %40, align 8
  %42 = getelementptr i8, i8* %41, i64 8
  store i8* %42, i8** %40, align 8
  br label %43

; <label>:43:                                     ; preds = %39, %33
  %.in27 = phi i8* [ %37, %33 ], [ %41, %39 ]
  %44 = bitcast i8* %.in27 to i16**
  %45 = load i16*, i16** %44, align 8
  store i16 %29, i16* %45, align 2
  br label %594

; <label>:46:                                     ; preds = %7
  %47 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 12
  %48 = load i16, i16* %47, align 4
  %49 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %50 = load i32, i32* %49, align 8
  %51 = icmp ult i32 %50, 41
  br i1 %51, label %52, label %58

; <label>:52:                                     ; preds = %46
  %53 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %54 = load i8*, i8** %53, align 8
  %55 = sext i32 %50 to i64
  %56 = getelementptr i8, i8* %54, i64 %55
  %57 = add i32 %50, 8
  store i32 %57, i32* %49, align 8
  br label %62

; <label>:58:                                     ; preds = %46
  %59 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %60 = load i8*, i8** %59, align 8
  %61 = getelementptr i8, i8* %60, i64 8
  store i8* %61, i8** %59, align 8
  br label %62

; <label>:62:                                     ; preds = %58, %52
  %.in26 = phi i8* [ %56, %52 ], [ %60, %58 ]
  %63 = bitcast i8* %.in26 to i16**
  %64 = load i16*, i16** %63, align 8
  store i16 %48, i16* %64, align 2
  br label %594

; <label>:65:                                     ; preds = %7
  %66 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 13
  %67 = load i16, i16* %66, align 2
  %68 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %69 = load i32, i32* %68, align 8
  %70 = icmp ult i32 %69, 41
  br i1 %70, label %71, label %77

; <label>:71:                                     ; preds = %65
  %72 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %73 = load i8*, i8** %72, align 8
  %74 = sext i32 %69 to i64
  %75 = getelementptr i8, i8* %73, i64 %74
  %76 = add i32 %69, 8
  store i32 %76, i32* %68, align 8
  br label %81

; <label>:77:                                     ; preds = %65
  %78 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %79 = load i8*, i8** %78, align 8
  %80 = getelementptr i8, i8* %79, i64 8
  store i8* %80, i8** %78, align 8
  br label %81

; <label>:81:                                     ; preds = %77, %71
  %.in25 = phi i8* [ %75, %71 ], [ %79, %77 ]
  %82 = bitcast i8* %.in25 to i16**
  %83 = load i16*, i16** %82, align 8
  store i16 %67, i16* %83, align 2
  br label %594

; <label>:84:                                     ; preds = %7
  %85 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 14
  %86 = load i16, i16* %85, align 8
  %87 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %88 = load i32, i32* %87, align 8
  %89 = icmp ult i32 %88, 41
  br i1 %89, label %90, label %96

; <label>:90:                                     ; preds = %84
  %91 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %92 = load i8*, i8** %91, align 8
  %93 = sext i32 %88 to i64
  %94 = getelementptr i8, i8* %92, i64 %93
  %95 = add i32 %88, 8
  store i32 %95, i32* %87, align 8
  br label %100

; <label>:96:                                     ; preds = %84
  %97 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %98 = load i8*, i8** %97, align 8
  %99 = getelementptr i8, i8* %98, i64 8
  store i8* %99, i8** %97, align 8
  br label %100

; <label>:100:                                    ; preds = %96, %90
  %.in24 = phi i8* [ %94, %90 ], [ %98, %96 ]
  %101 = bitcast i8* %.in24 to i16**
  %102 = load i16*, i16** %101, align 8
  store i16 %86, i16* %102, align 2
  br label %594

; <label>:103:                                    ; preds = %7
  %104 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  %105 = load i16, i16* %104, align 2
  %106 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %107 = load i32, i32* %106, align 8
  %108 = icmp ult i32 %107, 41
  br i1 %108, label %109, label %115

; <label>:109:                                    ; preds = %103
  %110 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %111 = load i8*, i8** %110, align 8
  %112 = sext i32 %107 to i64
  %113 = getelementptr i8, i8* %111, i64 %112
  %114 = add i32 %107, 8
  store i32 %114, i32* %106, align 8
  br label %119

; <label>:115:                                    ; preds = %103
  %116 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %117 = load i8*, i8** %116, align 8
  %118 = getelementptr i8, i8* %117, i64 8
  store i8* %118, i8** %116, align 8
  br label %119

; <label>:119:                                    ; preds = %115, %109
  %.in23 = phi i8* [ %113, %109 ], [ %117, %115 ]
  %120 = bitcast i8* %.in23 to i16**
  %121 = load i16*, i16** %120, align 8
  store i16 %105, i16* %121, align 2
  br label %594

; <label>:122:                                    ; preds = %7
  %123 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 16
  %124 = load i32, i32* %123, align 4
  %125 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %126 = load i32, i32* %125, align 8
  %127 = icmp ult i32 %126, 41
  br i1 %127, label %128, label %134

; <label>:128:                                    ; preds = %122
  %129 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %130 = load i8*, i8** %129, align 8
  %131 = sext i32 %126 to i64
  %132 = getelementptr i8, i8* %130, i64 %131
  %133 = add i32 %126, 8
  store i32 %133, i32* %125, align 8
  br label %138

; <label>:134:                                    ; preds = %122
  %135 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %136 = load i8*, i8** %135, align 8
  %137 = getelementptr i8, i8* %136, i64 8
  store i8* %137, i8** %135, align 8
  br label %138

; <label>:138:                                    ; preds = %134, %128
  %.in22 = phi i8* [ %132, %128 ], [ %136, %134 ]
  %139 = bitcast i8* %.in22 to i32**
  %140 = load i32*, i32** %139, align 8
  store i32 %124, i32* %140, align 4
  br label %594

; <label>:141:                                    ; preds = %7
  %142 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 17
  %143 = load i16, i16* %142, align 8
  %144 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %145 = load i32, i32* %144, align 8
  %146 = icmp ult i32 %145, 41
  br i1 %146, label %147, label %153

; <label>:147:                                    ; preds = %141
  %148 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %149 = load i8*, i8** %148, align 8
  %150 = sext i32 %145 to i64
  %151 = getelementptr i8, i8* %149, i64 %150
  %152 = add i32 %145, 8
  store i32 %152, i32* %144, align 8
  br label %157

; <label>:153:                                    ; preds = %141
  %154 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %155 = load i8*, i8** %154, align 8
  %156 = getelementptr i8, i8* %155, i64 8
  store i8* %156, i8** %154, align 8
  br label %157

; <label>:157:                                    ; preds = %153, %147
  %.in21 = phi i8* [ %151, %147 ], [ %155, %153 ]
  %158 = bitcast i8* %.in21 to i16**
  %159 = load i16*, i16** %158, align 8
  store i16 %143, i16* %159, align 2
  br label %594

; <label>:160:                                    ; preds = %7
  %161 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 18
  %162 = load i16, i16* %161, align 2
  %163 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %164 = load i32, i32* %163, align 8
  %165 = icmp ult i32 %164, 41
  br i1 %165, label %166, label %172

; <label>:166:                                    ; preds = %160
  %167 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %168 = load i8*, i8** %167, align 8
  %169 = sext i32 %164 to i64
  %170 = getelementptr i8, i8* %168, i64 %169
  %171 = add i32 %164, 8
  store i32 %171, i32* %163, align 8
  br label %176

; <label>:172:                                    ; preds = %160
  %173 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %174 = load i8*, i8** %173, align 8
  %175 = getelementptr i8, i8* %174, i64 8
  store i8* %175, i8** %173, align 8
  br label %176

; <label>:176:                                    ; preds = %172, %166
  %.in20 = phi i8* [ %170, %166 ], [ %174, %172 ]
  %177 = bitcast i8* %.in20 to i16**
  %178 = load i16*, i16** %177, align 8
  store i16 %162, i16* %178, align 2
  br label %594

; <label>:179:                                    ; preds = %7
  %180 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 24
  %181 = load i16, i16* %180, align 2
  %182 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %183 = load i32, i32* %182, align 8
  %184 = icmp ult i32 %183, 41
  br i1 %184, label %185, label %191

; <label>:185:                                    ; preds = %179
  %186 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %187 = load i8*, i8** %186, align 8
  %188 = sext i32 %183 to i64
  %189 = getelementptr i8, i8* %187, i64 %188
  %190 = add i32 %183, 8
  store i32 %190, i32* %182, align 8
  br label %195

; <label>:191:                                    ; preds = %179
  %192 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %193 = load i8*, i8** %192, align 8
  %194 = getelementptr i8, i8* %193, i64 8
  store i8* %194, i8** %192, align 8
  br label %195

; <label>:195:                                    ; preds = %191, %185
  %.in19 = phi i8* [ %189, %185 ], [ %193, %191 ]
  %196 = bitcast i8* %.in19 to i16**
  %197 = load i16*, i16** %196, align 8
  store i16 %181, i16* %197, align 2
  br label %594

; <label>:198:                                    ; preds = %7
  %199 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 23
  %200 = load i16, i16* %199, align 8
  %201 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %202 = load i32, i32* %201, align 8
  %203 = icmp ult i32 %202, 41
  br i1 %203, label %204, label %210

; <label>:204:                                    ; preds = %198
  %205 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %206 = load i8*, i8** %205, align 8
  %207 = sext i32 %202 to i64
  %208 = getelementptr i8, i8* %206, i64 %207
  %209 = add i32 %202, 8
  store i32 %209, i32* %201, align 8
  br label %214

; <label>:210:                                    ; preds = %198
  %211 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %212 = load i8*, i8** %211, align 8
  %213 = getelementptr i8, i8* %212, i64 8
  store i8* %213, i8** %211, align 8
  br label %214

; <label>:214:                                    ; preds = %210, %204
  %.in18 = phi i8* [ %208, %204 ], [ %212, %210 ]
  %215 = bitcast i8* %.in18 to i16**
  %216 = load i16*, i16** %215, align 8
  store i16 %200, i16* %216, align 2
  br label %594

; <label>:217:                                    ; preds = %7
  %218 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %219 = load i32, i32* %218, align 8
  %220 = icmp ult i32 %219, 41
  br i1 %220, label %221, label %227

; <label>:221:                                    ; preds = %217
  %222 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %223 = load i8*, i8** %222, align 8
  %224 = sext i32 %219 to i64
  %225 = getelementptr i8, i8* %223, i64 %224
  %226 = add i32 %219, 8
  store i32 %226, i32* %218, align 8
  br label %231

; <label>:227:                                    ; preds = %217
  %228 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %229 = load i8*, i8** %228, align 8
  %230 = getelementptr i8, i8* %229, i64 8
  store i8* %230, i8** %228, align 8
  br label %231

; <label>:231:                                    ; preds = %227, %221
  %.in16 = phi i8* [ %225, %221 ], [ %229, %227 ]
  %232 = bitcast i8* %.in16 to i16**
  %233 = load i16*, i16** %232, align 8
  store i16 0, i16* %233, align 2
  %234 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 8
  %235 = load i16, i16* %234, align 4
  %236 = zext i16 %235 to i32
  %237 = shl i32 1, %236
  %238 = add i32 %237, 65535
  %239 = trunc i32 %238 to i16
  %240 = load i32, i32* %218, align 8
  %241 = icmp ult i32 %240, 41
  br i1 %241, label %242, label %248

; <label>:242:                                    ; preds = %231
  %243 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %244 = load i8*, i8** %243, align 8
  %245 = sext i32 %240 to i64
  %246 = getelementptr i8, i8* %244, i64 %245
  %247 = add i32 %240, 8
  store i32 %247, i32* %218, align 8
  br label %252

; <label>:248:                                    ; preds = %231
  %249 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %250 = load i8*, i8** %249, align 8
  %251 = getelementptr i8, i8* %250, i64 8
  store i8* %251, i8** %249, align 8
  br label %252

; <label>:252:                                    ; preds = %248, %242
  %.in17 = phi i8* [ %246, %242 ], [ %250, %248 ]
  %253 = bitcast i8* %.in17 to i16**
  %254 = load i16*, i16** %253, align 8
  store i16 %239, i16* %254, align 2
  br label %594

; <label>:255:                                    ; preds = %7
  %256 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 55
  %257 = load i16, i16* %256, align 8
  %258 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %259 = load i32, i32* %258, align 8
  %260 = icmp ult i32 %259, 41
  br i1 %260, label %261, label %267

; <label>:261:                                    ; preds = %255
  %262 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %263 = load i8*, i8** %262, align 8
  %264 = sext i32 %259 to i64
  %265 = getelementptr i8, i8* %263, i64 %264
  %266 = add i32 %259, 8
  store i32 %266, i32* %258, align 8
  br label %271

; <label>:267:                                    ; preds = %255
  %268 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %269 = load i8*, i8** %268, align 8
  %270 = getelementptr i8, i8* %269, i64 8
  store i8* %270, i8** %268, align 8
  br label %271

; <label>:271:                                    ; preds = %267, %261
  %.in15 = phi i8* [ %265, %261 ], [ %269, %267 ]
  %272 = bitcast i8* %.in15 to i16**
  %273 = load i16*, i16** %272, align 8
  store i16 %257, i16* %273, align 2
  br label %594

; <label>:274:                                    ; preds = %7
  %275 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 56
  %276 = load i16, i16* %275, align 2
  %277 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %278 = load i32, i32* %277, align 8
  %279 = icmp ult i32 %278, 41
  br i1 %279, label %280, label %286

; <label>:280:                                    ; preds = %274
  %281 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %282 = load i8*, i8** %281, align 8
  %283 = sext i32 %278 to i64
  %284 = getelementptr i8, i8* %282, i64 %283
  %285 = add i32 %278, 8
  store i32 %285, i32* %277, align 8
  br label %290

; <label>:286:                                    ; preds = %274
  %287 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %288 = load i8*, i8** %287, align 8
  %289 = getelementptr i8, i8* %288, i64 8
  store i8* %289, i8** %287, align 8
  br label %290

; <label>:290:                                    ; preds = %286, %280
  %.in14 = phi i8* [ %284, %280 ], [ %288, %286 ]
  %291 = bitcast i8* %.in14 to i16**
  %292 = load i16*, i16** %291, align 8
  store i16 %276, i16* %292, align 2
  br label %594

; <label>:293:                                    ; preds = %7
  %294 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 30
  %295 = load i16, i16* %294, align 4
  %296 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %297 = load i32, i32* %296, align 8
  %298 = icmp ult i32 %297, 41
  br i1 %298, label %299, label %305

; <label>:299:                                    ; preds = %293
  %300 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %301 = load i8*, i8** %300, align 8
  %302 = sext i32 %297 to i64
  %303 = getelementptr i8, i8* %301, i64 %302
  %304 = add i32 %297, 8
  store i32 %304, i32* %296, align 8
  br label %309

; <label>:305:                                    ; preds = %293
  %306 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %307 = load i8*, i8** %306, align 8
  %308 = getelementptr i8, i8* %307, i64 8
  store i8* %308, i8** %306, align 8
  br label %309

; <label>:309:                                    ; preds = %305, %299
  %.in12 = phi i8* [ %303, %299 ], [ %307, %305 ]
  %310 = bitcast i8* %.in12 to i16**
  %311 = load i16*, i16** %310, align 8
  store i16 %295, i16* %311, align 2
  %312 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 31
  %313 = bitcast i16** %312 to i64*
  %314 = load i64, i64* %313, align 8
  %315 = load i32, i32* %296, align 8
  %316 = icmp ult i32 %315, 41
  br i1 %316, label %317, label %323

; <label>:317:                                    ; preds = %309
  %318 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %319 = load i8*, i8** %318, align 8
  %320 = sext i32 %315 to i64
  %321 = getelementptr i8, i8* %319, i64 %320
  %322 = add i32 %315, 8
  store i32 %322, i32* %296, align 8
  br label %327

; <label>:323:                                    ; preds = %309
  %324 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %325 = load i8*, i8** %324, align 8
  %326 = getelementptr i8, i8* %325, i64 8
  store i8* %326, i8** %324, align 8
  br label %327

; <label>:327:                                    ; preds = %323, %317
  %.in13 = phi i8* [ %321, %317 ], [ %325, %323 ]
  %328 = bitcast i8* %.in13 to i64**
  %329 = load i64*, i64** %328, align 8
  store i64 %314, i64* %329, align 8
  br label %594

; <label>:330:                                    ; preds = %7
  %331 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 30
  %332 = load i16, i16* %331, align 4
  %333 = icmp eq i16 %332, 1
  br i1 %333, label %334, label %339

; <label>:334:                                    ; preds = %330
  %335 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 31
  %336 = load i16*, i16** %335, align 8
  %337 = load i16, i16* %336, align 2
  %338 = icmp eq i16 %337, 1
  br label %339

; <label>:339:                                    ; preds = %334, %330
  %340 = phi i1 [ false, %330 ], [ %338, %334 ]
  %341 = zext i1 %340 to i16
  %342 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %343 = load i32, i32* %342, align 8
  %344 = icmp ult i32 %343, 41
  br i1 %344, label %345, label %351

; <label>:345:                                    ; preds = %339
  %346 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %347 = load i8*, i8** %346, align 8
  %348 = sext i32 %343 to i64
  %349 = getelementptr i8, i8* %347, i64 %348
  %350 = add i32 %343, 8
  store i32 %350, i32* %342, align 8
  br label %355

; <label>:351:                                    ; preds = %339
  %352 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %353 = load i8*, i8** %352, align 8
  %354 = getelementptr i8, i8* %353, i64 8
  store i8* %354, i8** %352, align 8
  br label %355

; <label>:355:                                    ; preds = %351, %345
  %.in11 = phi i8* [ %349, %345 ], [ %353, %351 ]
  %356 = bitcast i8* %.in11 to i16**
  %357 = load i16*, i16** %356, align 8
  store i16 %341, i16* %357, align 2
  br label %594

; <label>:358:                                    ; preds = %7
  %359 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 6
  %360 = load i32, i32* %359, align 4
  %361 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %362 = load i32, i32* %361, align 8
  %363 = icmp ult i32 %362, 41
  br i1 %363, label %364, label %370

; <label>:364:                                    ; preds = %358
  %365 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %366 = load i8*, i8** %365, align 8
  %367 = sext i32 %362 to i64
  %368 = getelementptr i8, i8* %366, i64 %367
  %369 = add i32 %362, 8
  store i32 %369, i32* %361, align 8
  br label %374

; <label>:370:                                    ; preds = %358
  %371 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %372 = load i8*, i8** %371, align 8
  %373 = getelementptr i8, i8* %372, i64 8
  store i8* %373, i8** %371, align 8
  br label %374

; <label>:374:                                    ; preds = %370, %364
  %.in10 = phi i8* [ %368, %364 ], [ %372, %370 ]
  %375 = bitcast i8* %.in10 to i32**
  %376 = load i32*, i32** %375, align 8
  store i32 %360, i32* %376, align 4
  br label %594

; <label>:377:                                    ; preds = %7
  %378 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 9
  %379 = load i16, i16* %378, align 2
  %380 = add i16 %379, -1
  %381 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %382 = load i32, i32* %381, align 8
  %383 = icmp ult i32 %382, 41
  br i1 %383, label %384, label %390

; <label>:384:                                    ; preds = %377
  %385 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %386 = load i8*, i8** %385, align 8
  %387 = sext i32 %382 to i64
  %388 = getelementptr i8, i8* %386, i64 %387
  %389 = add i32 %382, 8
  store i32 %389, i32* %381, align 8
  br label %394

; <label>:390:                                    ; preds = %377
  %391 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %392 = load i8*, i8** %391, align 8
  %393 = getelementptr i8, i8* %392, i64 8
  store i8* %393, i8** %391, align 8
  br label %394

; <label>:394:                                    ; preds = %390, %384
  %.in9 = phi i8* [ %388, %384 ], [ %392, %390 ]
  %395 = bitcast i8* %.in9 to i16**
  %396 = load i16*, i16** %395, align 8
  store i16 %380, i16* %396, align 2
  br label %594

; <label>:397:                                    ; preds = %7
  %398 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 3
  %399 = load i32, i32* %398, align 8
  %400 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %401 = load i32, i32* %400, align 8
  %402 = icmp ult i32 %401, 41
  br i1 %402, label %403, label %409

; <label>:403:                                    ; preds = %397
  %404 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %405 = load i8*, i8** %404, align 8
  %406 = sext i32 %401 to i64
  %407 = getelementptr i8, i8* %405, i64 %406
  %408 = add i32 %401, 8
  store i32 %408, i32* %400, align 8
  br label %413

; <label>:409:                                    ; preds = %397
  %410 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %411 = load i8*, i8** %410, align 8
  %412 = getelementptr i8, i8* %411, i64 8
  store i8* %412, i8** %410, align 8
  br label %413

; <label>:413:                                    ; preds = %409, %403
  %.in8 = phi i8* [ %407, %403 ], [ %411, %409 ]
  %414 = bitcast i8* %.in8 to i32**
  %415 = load i32*, i32** %414, align 8
  store i32 %399, i32* %415, align 4
  br label %594

; <label>:416:                                    ; preds = %7
  %417 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 48
  %418 = load float*, float** %417, align 8
  %419 = icmp eq float* %418, null
  br i1 %419, label %420, label %427

; <label>:420:                                    ; preds = %416
  %421 = tail call i8* @_TIFFmalloc(i32 12) #2
  %422 = bitcast float** %417 to i8**
  store i8* %421, i8** %422, align 8
  %.cast = bitcast i8* %421 to float*
  store float 0x3FD322D0E0000000, float* %.cast, align 4
  %423 = load float*, float** %417, align 8
  %424 = getelementptr inbounds float, float* %423, i64 1
  store float 0x3FE2C8B440000000, float* %424, align 4
  %425 = load float*, float** %417, align 8
  %426 = getelementptr inbounds float, float* %425, i64 2
  store float 0x3FBD2F1AA0000000, float* %426, align 4
  br label %427

; <label>:427:                                    ; preds = %416, %420
  %428 = bitcast float** %417 to i64*
  %429 = load i64, i64* %428, align 8
  %430 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %431 = load i32, i32* %430, align 8
  %432 = icmp ult i32 %431, 41
  br i1 %432, label %433, label %439

; <label>:433:                                    ; preds = %427
  %434 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %435 = load i8*, i8** %434, align 8
  %436 = sext i32 %431 to i64
  %437 = getelementptr i8, i8* %435, i64 %436
  %438 = add i32 %431, 8
  store i32 %438, i32* %430, align 8
  br label %443

; <label>:439:                                    ; preds = %427
  %440 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %441 = load i8*, i8** %440, align 8
  %442 = getelementptr i8, i8* %441, i64 8
  store i8* %442, i8** %440, align 8
  br label %443

; <label>:443:                                    ; preds = %439, %433
  %.in7 = phi i8* [ %437, %433 ], [ %441, %439 ]
  %444 = bitcast i8* %.in7 to i64**
  %445 = load i64*, i64** %444, align 8
  store i64 %429, i64* %445, align 8
  br label %594

; <label>:446:                                    ; preds = %7
  %447 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 49, i64 0
  %448 = load i16, i16* %447, align 8
  %449 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %450 = load i32, i32* %449, align 8
  %451 = icmp ult i32 %450, 41
  br i1 %451, label %452, label %458

; <label>:452:                                    ; preds = %446
  %453 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %454 = load i8*, i8** %453, align 8
  %455 = sext i32 %450 to i64
  %456 = getelementptr i8, i8* %454, i64 %455
  %457 = add i32 %450, 8
  store i32 %457, i32* %449, align 8
  br label %462

; <label>:458:                                    ; preds = %446
  %459 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %460 = load i8*, i8** %459, align 8
  %461 = getelementptr i8, i8* %460, i64 8
  store i8* %461, i8** %459, align 8
  br label %462

; <label>:462:                                    ; preds = %458, %452
  %.in5 = phi i8* [ %456, %452 ], [ %460, %458 ]
  %463 = bitcast i8* %.in5 to i16**
  %464 = load i16*, i16** %463, align 8
  store i16 %448, i16* %464, align 2
  %465 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 49, i64 1
  %466 = load i16, i16* %465, align 2
  %467 = load i32, i32* %449, align 8
  %468 = icmp ult i32 %467, 41
  br i1 %468, label %469, label %475

; <label>:469:                                    ; preds = %462
  %470 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %471 = load i8*, i8** %470, align 8
  %472 = sext i32 %467 to i64
  %473 = getelementptr i8, i8* %471, i64 %472
  %474 = add i32 %467, 8
  store i32 %474, i32* %449, align 8
  br label %479

; <label>:475:                                    ; preds = %462
  %476 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %477 = load i8*, i8** %476, align 8
  %478 = getelementptr i8, i8* %477, i64 8
  store i8* %478, i8** %476, align 8
  br label %479

; <label>:479:                                    ; preds = %475, %469
  %.in6 = phi i8* [ %473, %469 ], [ %477, %475 ]
  %480 = bitcast i8* %.in6 to i16**
  %481 = load i16*, i16** %480, align 8
  store i16 %466, i16* %481, align 2
  br label %594

; <label>:482:                                    ; preds = %7
  %483 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 50
  %484 = load i16, i16* %483, align 4
  %485 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %486 = load i32, i32* %485, align 8
  %487 = icmp ult i32 %486, 41
  br i1 %487, label %488, label %494

; <label>:488:                                    ; preds = %482
  %489 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %490 = load i8*, i8** %489, align 8
  %491 = sext i32 %486 to i64
  %492 = getelementptr i8, i8* %490, i64 %491
  %493 = add i32 %486, 8
  store i32 %493, i32* %485, align 8
  br label %498

; <label>:494:                                    ; preds = %482
  %495 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %496 = load i8*, i8** %495, align 8
  %497 = getelementptr i8, i8* %496, i64 8
  store i8* %497, i8** %495, align 8
  br label %498

; <label>:498:                                    ; preds = %494, %488
  %.in4 = phi i8* [ %492, %488 ], [ %496, %494 ]
  %499 = bitcast i8* %.in4 to i16**
  %500 = load i16*, i16** %499, align 8
  store i16 %484, i16* %500, align 2
  br label %594

; <label>:501:                                    ; preds = %7
  %502 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 54, i64 0
  %503 = load i16*, i16** %502, align 8
  %504 = icmp eq i16* %503, null
  br i1 %504, label %505, label %506

; <label>:505:                                    ; preds = %501
  tail call fastcc void @TIFFDefaultTransferFunction(%struct.TIFFDirectory* nonnull %4)
  br label %506

; <label>:506:                                    ; preds = %501, %505
  %507 = bitcast i16** %502 to i64*
  %508 = load i64, i64* %507, align 8
  %509 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %510 = load i32, i32* %509, align 8
  %511 = icmp ult i32 %510, 41
  br i1 %511, label %512, label %518

; <label>:512:                                    ; preds = %506
  %513 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %514 = load i8*, i8** %513, align 8
  %515 = sext i32 %510 to i64
  %516 = getelementptr i8, i8* %514, i64 %515
  %517 = add i32 %510, 8
  store i32 %517, i32* %509, align 8
  br label %522

; <label>:518:                                    ; preds = %506
  %519 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %520 = load i8*, i8** %519, align 8
  %521 = getelementptr i8, i8* %520, i64 8
  store i8* %521, i8** %519, align 8
  br label %522

; <label>:522:                                    ; preds = %518, %512
  %.in1 = phi i8* [ %516, %512 ], [ %520, %518 ]
  %523 = bitcast i8* %.in1 to i64**
  %524 = load i64*, i64** %523, align 8
  store i64 %508, i64* %524, align 8
  %525 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  %526 = load i16, i16* %525, align 2
  %527 = zext i16 %526 to i32
  %528 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 30
  %529 = load i16, i16* %528, align 4
  %530 = zext i16 %529 to i32
  %531 = sub nsw i32 %527, %530
  %532 = icmp sgt i32 %531, 1
  br i1 %532, label %533, label %594

; <label>:533:                                    ; preds = %522
  %534 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 54, i64 1
  %535 = bitcast i16** %534 to i64*
  %536 = load i64, i64* %535, align 8
  %537 = load i32, i32* %509, align 8
  %538 = icmp ult i32 %537, 41
  br i1 %538, label %539, label %545

; <label>:539:                                    ; preds = %533
  %540 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %541 = load i8*, i8** %540, align 8
  %542 = sext i32 %537 to i64
  %543 = getelementptr i8, i8* %541, i64 %542
  %544 = add i32 %537, 8
  store i32 %544, i32* %509, align 8
  br label %549

; <label>:545:                                    ; preds = %533
  %546 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %547 = load i8*, i8** %546, align 8
  %548 = getelementptr i8, i8* %547, i64 8
  store i8* %548, i8** %546, align 8
  br label %549

; <label>:549:                                    ; preds = %545, %539
  %.in2 = phi i8* [ %543, %539 ], [ %547, %545 ]
  %550 = bitcast i8* %.in2 to i64**
  %551 = load i64*, i64** %550, align 8
  store i64 %536, i64* %551, align 8
  %552 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 54, i64 2
  %553 = bitcast i16** %552 to i64*
  %554 = load i64, i64* %553, align 8
  %555 = load i32, i32* %509, align 8
  %556 = icmp ult i32 %555, 41
  br i1 %556, label %557, label %563

; <label>:557:                                    ; preds = %549
  %558 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %559 = load i8*, i8** %558, align 8
  %560 = sext i32 %555 to i64
  %561 = getelementptr i8, i8* %559, i64 %560
  %562 = add i32 %555, 8
  store i32 %562, i32* %509, align 8
  br label %567

; <label>:563:                                    ; preds = %549
  %564 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %565 = load i8*, i8** %564, align 8
  %566 = getelementptr i8, i8* %565, i64 8
  store i8* %566, i8** %564, align 8
  br label %567

; <label>:567:                                    ; preds = %563, %557
  %.in3 = phi i8* [ %561, %557 ], [ %565, %563 ]
  %568 = bitcast i8* %.in3 to i64**
  %569 = load i64*, i64** %568, align 8
  store i64 %554, i64* %569, align 8
  br label %594

; <label>:570:                                    ; preds = %7
  %571 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 53
  %572 = load float*, float** %571, align 8
  %573 = icmp eq float* %572, null
  br i1 %573, label %574, label %575

; <label>:574:                                    ; preds = %570
  tail call fastcc void @TIFFDefaultRefBlackWhite(%struct.TIFFDirectory* nonnull %4)
  br label %575

; <label>:575:                                    ; preds = %570, %574
  %576 = bitcast float** %571 to i64*
  %577 = load i64, i64* %576, align 8
  %578 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %579 = load i32, i32* %578, align 8
  %580 = icmp ult i32 %579, 41
  br i1 %580, label %581, label %587

; <label>:581:                                    ; preds = %575
  %582 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %583 = load i8*, i8** %582, align 8
  %584 = sext i32 %579 to i64
  %585 = getelementptr i8, i8* %583, i64 %584
  %586 = add i32 %579, 8
  store i32 %586, i32* %578, align 8
  br label %591

; <label>:587:                                    ; preds = %575
  %588 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %589 = load i8*, i8** %588, align 8
  %590 = getelementptr i8, i8* %589, i64 8
  store i8* %590, i8** %588, align 8
  br label %591

; <label>:591:                                    ; preds = %587, %581
  %.in = phi i8* [ %585, %581 ], [ %589, %587 ]
  %592 = bitcast i8* %.in to i64**
  %593 = load i64*, i64** %592, align 8
  store i64 %577, i64* %593, align 8
  br label %594

; <label>:594:                                    ; preds = %7, %522, %567, %3, %591, %498, %479, %443, %413, %394, %374, %355, %327, %290, %271, %252, %214, %195, %176, %157, %138, %119, %100, %81, %62, %43, %24
  %.0 = phi i32 [ 1, %591 ], [ 1, %498 ], [ 1, %479 ], [ 1, %443 ], [ 1, %413 ], [ 1, %394 ], [ 1, %374 ], [ 1, %355 ], [ 1, %327 ], [ 1, %290 ], [ 1, %271 ], [ 1, %252 ], [ 1, %214 ], [ 1, %195 ], [ 1, %176 ], [ 1, %157 ], [ 1, %138 ], [ 1, %119 ], [ 1, %100 ], [ 1, %81 ], [ 1, %62 ], [ 1, %43 ], [ 1, %24 ], [ 1, %3 ], [ 1, %567 ], [ 1, %522 ], [ 0, %7 ]
  ret i32 %.0
}

declare i32 @TIFFVGetField(%struct.tiff*, i32, %struct.__va_list_tag*) local_unnamed_addr #1

declare i8* @_TIFFmalloc(i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @TIFFDefaultTransferFunction(%struct.TIFFDirectory* nocapture) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %0, i64 0, i32 54, i64 0
  %3 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %0, i64 0, i32 8
  %4 = load i16, i16* %3, align 4
  %5 = zext i16 %4 to i32
  %6 = shl i32 1, %5
  %7 = sext i32 %6 to i64
  %8 = shl i32 %6, 1
  %9 = tail call i8* @_TIFFmalloc(i32 %8) #2
  %10 = bitcast i16** %2 to i8**
  store i8* %9, i8** %10, align 8
  %.cast = bitcast i8* %9 to i16*
  store i16 0, i16* %.cast, align 2
  %11 = icmp sgt i32 %6, 1
  br i1 %11, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %1
  %12 = sitofp i32 %6 to double
  %13 = fadd double %12, -1.000000e+00
  %14 = and i64 %7, 1
  %lcmp.mod = icmp eq i64 %14, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph
  %15 = fdiv double 1.000000e+00, %13
  %16 = tail call double @pow(double %15, double 2.200000e+00) #2
  %17 = fmul double %16, 6.553500e+04
  %18 = fadd double %17, 5.000000e-01
  %19 = tail call double @floor(double %18) #5
  %20 = fptoui double %19 to i16
  %21 = load i16*, i16** %2, align 8
  %22 = getelementptr inbounds i16, i16* %21, i64 1
  store i16 %20, i16* %22, align 2
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %.01.unr = phi i64 [ 1, %.lr.ph ], [ 2, %.prol.preheader ]
  %23 = icmp eq i16 %4, 1
  br i1 %23, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %.01 = phi i64 [ %43, %.lr.ph.new ], [ %.01.unr, %.lr.ph.new.preheader ]
  %24 = sitofp i64 %.01 to double
  %25 = fdiv double %24, %13
  %26 = tail call double @pow(double %25, double 2.200000e+00) #2
  %27 = fmul double %26, 6.553500e+04
  %28 = fadd double %27, 5.000000e-01
  %29 = tail call double @floor(double %28) #5
  %30 = fptoui double %29 to i16
  %31 = load i16*, i16** %2, align 8
  %32 = getelementptr inbounds i16, i16* %31, i64 %.01
  store i16 %30, i16* %32, align 2
  %33 = add nuw nsw i64 %.01, 1
  %34 = sitofp i64 %33 to double
  %35 = fdiv double %34, %13
  %36 = tail call double @pow(double %35, double 2.200000e+00) #2
  %37 = fmul double %36, 6.553500e+04
  %38 = fadd double %37, 5.000000e-01
  %39 = tail call double @floor(double %38) #5
  %40 = fptoui double %39 to i16
  %41 = load i16*, i16** %2, align 8
  %42 = getelementptr inbounds i16, i16* %41, i64 %33
  store i16 %40, i16* %42, align 2
  %43 = add nsw i64 %.01, 2
  %exitcond.1 = icmp eq i64 %43, %7
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %1
  %44 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %0, i64 0, i32 15
  %45 = load i16, i16* %44, align 2
  %46 = zext i16 %45 to i32
  %47 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %0, i64 0, i32 30
  %48 = load i16, i16* %47, align 4
  %49 = zext i16 %48 to i32
  %50 = sub nsw i32 %46, %49
  %51 = icmp sgt i32 %50, 1
  br i1 %51, label %52, label %61

; <label>:52:                                     ; preds = %._crit_edge
  %53 = tail call i8* @_TIFFmalloc(i32 %8) #2
  %54 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %0, i64 0, i32 54, i64 1
  %55 = bitcast i16** %54 to i8**
  store i8* %53, i8** %55, align 8
  %56 = load i8*, i8** %10, align 8
  tail call void @_TIFFmemcpy(i8* %53, i8* %56, i32 %8) #2
  %57 = tail call i8* @_TIFFmalloc(i32 %8) #2
  %58 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %0, i64 0, i32 54, i64 2
  %59 = bitcast i16** %58 to i8**
  store i8* %57, i8** %59, align 8
  %60 = load i8*, i8** %10, align 8
  tail call void @_TIFFmemcpy(i8* %57, i8* %60, i32 %8) #2
  br label %61

; <label>:61:                                     ; preds = %52, %._crit_edge
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @TIFFDefaultRefBlackWhite(%struct.TIFFDirectory* nocapture) unnamed_addr #0 {
  %2 = tail call i8* @_TIFFmalloc(i32 24) #2
  %3 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %0, i64 0, i32 53
  %4 = bitcast float** %3 to i8**
  store i8* %2, i8** %4, align 8
  %5 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %0, i64 0, i32 8
  %.cast = bitcast i8* %2 to float*
  store float 0.000000e+00, float* %.cast, align 4
  %6 = load i16, i16* %5, align 4
  %7 = zext i16 %6 to i64
  %8 = shl i64 1, %7
  %9 = add nsw i64 %8, -1
  %10 = sitofp i64 %9 to float
  %11 = load float*, float** %3, align 8
  %12 = getelementptr inbounds float, float* %11, i64 1
  store float %10, float* %12, align 4
  %13 = load float*, float** %3, align 8
  %14 = getelementptr inbounds float, float* %13, i64 2
  store float 0.000000e+00, float* %14, align 4
  %15 = load i16, i16* %5, align 4
  %16 = zext i16 %15 to i64
  %17 = shl i64 1, %16
  %18 = add nsw i64 %17, -1
  %19 = sitofp i64 %18 to float
  %20 = load float*, float** %3, align 8
  %21 = getelementptr inbounds float, float* %20, i64 3
  store float %19, float* %21, align 4
  %22 = load float*, float** %3, align 8
  %23 = getelementptr inbounds float, float* %22, i64 4
  store float 0.000000e+00, float* %23, align 4
  %24 = load i16, i16* %5, align 4
  %25 = zext i16 %24 to i64
  %26 = shl i64 1, %25
  %27 = add nsw i64 %26, -1
  %28 = sitofp i64 %27 to float
  %29 = load float*, float** %3, align 8
  %30 = getelementptr inbounds float, float* %29, i64 5
  store float %28, float* %30, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFGetFieldDefaulted(%struct.tiff*, i32, ...) local_unnamed_addr #0 {
  %3 = alloca [1 x %struct.__va_list_tag], align 16
  %4 = bitcast [1 x %struct.__va_list_tag]* %3 to i8*
  call void @llvm.va_start(i8* nonnull %4)
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0
  %6 = call i32 @TIFFVGetFieldDefaulted(%struct.tiff* %0, i32 %1, %struct.__va_list_tag* nonnull %5)
  call void @llvm.va_end(i8* nonnull %4)
  ret i32 %6
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #2

; Function Attrs: nounwind readnone
declare double @floor(double) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @pow(double, double) local_unnamed_addr #4

declare void @_TIFFmemcpy(i8*, i8*, i32) local_unnamed_addr #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
