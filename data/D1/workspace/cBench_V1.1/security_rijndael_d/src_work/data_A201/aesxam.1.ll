; ModuleID = 'aesxam.ll'
source_filename = "aesxam.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.aes = type { i64, i64, [64 x i64], [64 x i64], i8 }
%struct._G_fpos_t = type { i64, %struct.__mbstate_t }
%struct.__mbstate_t = type { i32, %union.anon }
%union.anon = type { i32 }

@fillrand.mt = internal unnamed_addr global i1 false, align 8
@fillrand.count = internal unnamed_addr global i64 4, align 8
@fillrand.r = internal unnamed_addr global [4 x i8] zeroinitializer, align 8
@.str = private unnamed_addr constant [34 x i8] c"Error writing to output file: %s\0A\00", align 1
@.str.1 = private unnamed_addr constant [35 x i8] c"Error reading from input file: %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [27 x i8] c"\0AThe input file is corrupt\00", align 1
@.str.3 = private unnamed_addr constant [59 x i8] c"usage: rijndael in_filename out_filename [d/e] key_in_hex\0A\00", align 1
@.str.4 = private unnamed_addr constant [37 x i8] c"key must be in hexadecimal notation\0A\00", align 1
@.str.5 = private unnamed_addr constant [27 x i8] c"The key value is too long\0A\00", align 1
@.str.6 = private unnamed_addr constant [56 x i8] c"The key length must be 32, 48 or 64 hexadecimal digits\0A\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.8 = private unnamed_addr constant [40 x i8] c"The input file: %s could not be opened\0A\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str.10 = private unnamed_addr constant [41 x i8] c"The output file: %s could not be opened\0A\00", align 1
@fillrand.a.0 = internal unnamed_addr global i64 0, align 16
@fillrand.a.1 = internal unnamed_addr global i64 0, align 16
@str = private unnamed_addr constant [55 x i8] c"The key length must be 32, 48 or 64 hexadecimal digits\00"
@str.1 = private unnamed_addr constant [26 x i8] c"The key value is too long\00"
@str.2 = private unnamed_addr constant [36 x i8] c"key must be in hexadecimal notation\00"
@str.3 = private unnamed_addr constant [58 x i8] c"usage: rijndael in_filename out_filename [d/e] key_in_hex\00"

; Function Attrs: noinline norecurse nounwind uwtable
define void @fillrand(i8* nocapture, i32) local_unnamed_addr #0 {
  %.b = load i1, i1* @fillrand.mt, align 8
  br i1 %.b, label %.preheader, label %3

; <label>:3:                                      ; preds = %2
  store i1 true, i1* @fillrand.mt, align 8
  store i64 60147, i64* @fillrand.a.0, align 16
  store i64 13822, i64* @fillrand.a.1, align 16
  br label %.preheader

.preheader:                                       ; preds = %2, %3
  %4 = icmp sgt i32 %1, 0
  br i1 %4, label %.lr.ph, label %27

.lr.ph:                                           ; preds = %.preheader
  %fillrand.count.promoted = load i64, i64* @fillrand.count, align 8
  %wide.trip.count = zext i32 %1 to i64
  br label %5

; <label>:5:                                      ; preds = %21, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %21 ]
  %6 = phi i64 [ %fillrand.count.promoted, %.lr.ph ], [ %23, %21 ]
  %7 = icmp eq i64 %6, 4
  br i1 %7, label %8, label %21

; <label>:8:                                      ; preds = %5
  %9 = load i64, i64* @fillrand.a.0, align 16
  %10 = and i64 %9, 65535
  %11 = mul nuw nsw i64 %10, 36969
  %12 = lshr i64 %9, 16
  %13 = add nuw nsw i64 %11, %12
  store i64 %13, i64* @fillrand.a.0, align 16
  %14 = shl i64 %13, 16
  %15 = load i64, i64* @fillrand.a.1, align 16
  %16 = and i64 %15, 65535
  %17 = mul nuw nsw i64 %16, 18000
  %18 = lshr i64 %15, 16
  %19 = add nuw nsw i64 %17, %18
  store i64 %19, i64* @fillrand.a.1, align 16
  %20 = add i64 %19, %14
  store i64 %20, i64* bitcast ([4 x i8]* @fillrand.r to i64*), align 8
  br label %21

; <label>:21:                                     ; preds = %8, %5
  %22 = phi i64 [ 0, %8 ], [ %6, %5 ]
  %23 = add i64 %22, 1
  %24 = getelementptr inbounds [4 x i8], [4 x i8]* @fillrand.r, i64 0, i64 %22
  %25 = load i8, i8* %24, align 1
  %26 = getelementptr inbounds i8, i8* %0, i64 %indvars.iv
  store i8 %25, i8* %26, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge, label %5

._crit_edge:                                      ; preds = %21
  store i64 %23, i64* @fillrand.count, align 8
  br label %27

; <label>:27:                                     ; preds = %._crit_edge, %.preheader
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @encfile(%struct._IO_FILE* nocapture, %struct._IO_FILE* nocapture, %struct.aes*, i8*) local_unnamed_addr #1 {
  %5 = alloca [16 x i8], align 16
  %6 = alloca [16 x i8], align 16
  %7 = alloca i64, align 8
  %8 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 0
  call void @fillrand(i8* nonnull %8, i32 16)
  %9 = tail call i32 @fseek(%struct._IO_FILE* %0, i64 0, i32 2)
  %10 = bitcast i64* %7 to %struct._G_fpos_t*
  %11 = call i32 @fgetpos(%struct._IO_FILE* %0, %struct._G_fpos_t* nonnull %10)
  %12 = tail call i32 @fseek(%struct._IO_FILE* %0, i64 0, i32 0)
  %13 = call i64 @fwrite(i8* nonnull %8, i64 1, i64 16, %struct._IO_FILE* %1)
  %14 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 0
  call void @fillrand(i8* nonnull %14, i32 1)
  %15 = load i64, i64* %7, align 8
  %16 = trunc i64 %15 to i8
  %17 = and i8 %16, 15
  %18 = load i8, i8* %14, align 16
  %19 = and i8 %18, -16
  %20 = or i8 %17, %19
  store i8 %20, i8* %14, align 16
  %21 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 16
  %22 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 0
  %23 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 0
  %24 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 1
  %25 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 1
  %26 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 2
  %27 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 2
  %28 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 3
  %29 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 3
  %30 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 4
  %31 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 4
  %32 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 5
  %33 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 5
  %34 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 6
  %35 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 6
  %36 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 7
  %37 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 7
  %38 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 8
  %39 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 8
  %40 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 9
  %41 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 9
  %42 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 10
  %43 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 10
  %44 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 11
  %45 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 11
  %46 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 12
  %47 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 12
  %48 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 13
  %49 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 13
  %50 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 14
  %51 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 14
  %52 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 15
  %53 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 15
  br label %54

; <label>:54:                                     ; preds = %.preheader4, %4
  %.02 = phi i64 [ 0, %4 ], [ 16, %.preheader4 ]
  %.01 = phi i64 [ 15, %4 ], [ 16, %.preheader4 ]
  %55 = call i32 @feof(%struct._IO_FILE* %0) #5
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %57, label %115

; <label>:57:                                     ; preds = %54
  %58 = sub nsw i64 0, %.01
  %59 = getelementptr inbounds i8, i8* %21, i64 %58
  %60 = call i64 @fread(i8* %59, i64 1, i64 %.01, %struct._IO_FILE* %0)
  %61 = icmp ult i64 %60, %.01
  br i1 %61, label %115, label %.preheader4

.preheader4:                                      ; preds = %57
  %62 = load i8, i8* %22, align 16
  %63 = load i8, i8* %23, align 16
  %64 = xor i8 %63, %62
  store i8 %64, i8* %23, align 16
  %65 = load i8, i8* %24, align 1
  %66 = load i8, i8* %25, align 1
  %67 = xor i8 %66, %65
  store i8 %67, i8* %25, align 1
  %68 = load i8, i8* %26, align 2
  %69 = load i8, i8* %27, align 2
  %70 = xor i8 %69, %68
  store i8 %70, i8* %27, align 2
  %71 = load i8, i8* %28, align 1
  %72 = load i8, i8* %29, align 1
  %73 = xor i8 %72, %71
  store i8 %73, i8* %29, align 1
  %74 = load i8, i8* %30, align 4
  %75 = load i8, i8* %31, align 4
  %76 = xor i8 %75, %74
  store i8 %76, i8* %31, align 4
  %77 = load i8, i8* %32, align 1
  %78 = load i8, i8* %33, align 1
  %79 = xor i8 %78, %77
  store i8 %79, i8* %33, align 1
  %80 = load i8, i8* %34, align 2
  %81 = load i8, i8* %35, align 2
  %82 = xor i8 %81, %80
  store i8 %82, i8* %35, align 2
  %83 = load i8, i8* %36, align 1
  %84 = load i8, i8* %37, align 1
  %85 = xor i8 %84, %83
  store i8 %85, i8* %37, align 1
  %86 = load i8, i8* %38, align 8
  %87 = load i8, i8* %39, align 8
  %88 = xor i8 %87, %86
  store i8 %88, i8* %39, align 8
  %89 = load i8, i8* %40, align 1
  %90 = load i8, i8* %41, align 1
  %91 = xor i8 %90, %89
  store i8 %91, i8* %41, align 1
  %92 = load i8, i8* %42, align 2
  %93 = load i8, i8* %43, align 2
  %94 = xor i8 %93, %92
  store i8 %94, i8* %43, align 2
  %95 = load i8, i8* %44, align 1
  %96 = load i8, i8* %45, align 1
  %97 = xor i8 %96, %95
  store i8 %97, i8* %45, align 1
  %98 = load i8, i8* %46, align 4
  %99 = load i8, i8* %47, align 4
  %100 = xor i8 %99, %98
  store i8 %100, i8* %47, align 4
  %101 = load i8, i8* %48, align 1
  %102 = load i8, i8* %49, align 1
  %103 = xor i8 %102, %101
  store i8 %103, i8* %49, align 1
  %104 = load i8, i8* %50, align 2
  %105 = load i8, i8* %51, align 2
  %106 = xor i8 %105, %104
  store i8 %106, i8* %51, align 2
  %107 = load i8, i8* %52, align 1
  %108 = load i8, i8* %53, align 1
  %109 = xor i8 %108, %107
  store i8 %109, i8* %53, align 1
  %110 = call signext i16 @encrypt(i8* nonnull %14, i8* nonnull %8, %struct.aes* %2) #5
  %111 = call i64 @fwrite(i8* nonnull %8, i64 1, i64 16, %struct._IO_FILE* %1)
  %112 = icmp eq i64 %111, 16
  br i1 %112, label %54, label %113

; <label>:113:                                    ; preds = %.preheader4
  %114 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0), i8* %3)
  br label %207

; <label>:115:                                    ; preds = %57, %54
  %.2 = phi i64 [ %.02, %54 ], [ %60, %57 ]
  %116 = icmp eq i64 %.01, 15
  %117 = zext i1 %116 to i64
  %..2 = add i64 %.2, %117
  %118 = icmp eq i64 %..2, 0
  br i1 %118, label %207, label %.preheader3

.preheader3:                                      ; preds = %115
  %119 = icmp ult i64 %..2, 16
  br i1 %119, label %.preheader.preheader.loopexit, label %.preheader

.preheader.preheader.loopexit:                    ; preds = %.preheader3
  %scevgep = getelementptr [16 x i8], [16 x i8]* %5, i64 0, i64 %..2
  %120 = sub i64 16, %.2
  %121 = sub i64 %120, %117
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %121, i32 1, i1 false)
  br label %.preheader

.preheader:                                       ; preds = %.preheader3, %.preheader.preheader.loopexit
  %122 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 0
  %123 = load i8, i8* %122, align 16
  %124 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 0
  %125 = load i8, i8* %124, align 16
  %126 = xor i8 %125, %123
  store i8 %126, i8* %124, align 16
  %127 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 1
  %128 = load i8, i8* %127, align 1
  %129 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 1
  %130 = load i8, i8* %129, align 1
  %131 = xor i8 %130, %128
  store i8 %131, i8* %129, align 1
  %132 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 2
  %133 = load i8, i8* %132, align 2
  %134 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 2
  %135 = load i8, i8* %134, align 2
  %136 = xor i8 %135, %133
  store i8 %136, i8* %134, align 2
  %137 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 3
  %138 = load i8, i8* %137, align 1
  %139 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 3
  %140 = load i8, i8* %139, align 1
  %141 = xor i8 %140, %138
  store i8 %141, i8* %139, align 1
  %142 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 4
  %143 = load i8, i8* %142, align 4
  %144 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 4
  %145 = load i8, i8* %144, align 4
  %146 = xor i8 %145, %143
  store i8 %146, i8* %144, align 4
  %147 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 5
  %148 = load i8, i8* %147, align 1
  %149 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 5
  %150 = load i8, i8* %149, align 1
  %151 = xor i8 %150, %148
  store i8 %151, i8* %149, align 1
  %152 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 6
  %153 = load i8, i8* %152, align 2
  %154 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 6
  %155 = load i8, i8* %154, align 2
  %156 = xor i8 %155, %153
  store i8 %156, i8* %154, align 2
  %157 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 7
  %158 = load i8, i8* %157, align 1
  %159 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 7
  %160 = load i8, i8* %159, align 1
  %161 = xor i8 %160, %158
  store i8 %161, i8* %159, align 1
  %162 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 8
  %163 = load i8, i8* %162, align 8
  %164 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 8
  %165 = load i8, i8* %164, align 8
  %166 = xor i8 %165, %163
  store i8 %166, i8* %164, align 8
  %167 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 9
  %168 = load i8, i8* %167, align 1
  %169 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 9
  %170 = load i8, i8* %169, align 1
  %171 = xor i8 %170, %168
  store i8 %171, i8* %169, align 1
  %172 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 10
  %173 = load i8, i8* %172, align 2
  %174 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 10
  %175 = load i8, i8* %174, align 2
  %176 = xor i8 %175, %173
  store i8 %176, i8* %174, align 2
  %177 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 11
  %178 = load i8, i8* %177, align 1
  %179 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 11
  %180 = load i8, i8* %179, align 1
  %181 = xor i8 %180, %178
  store i8 %181, i8* %179, align 1
  %182 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 12
  %183 = load i8, i8* %182, align 4
  %184 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 12
  %185 = load i8, i8* %184, align 4
  %186 = xor i8 %185, %183
  store i8 %186, i8* %184, align 4
  %187 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 13
  %188 = load i8, i8* %187, align 1
  %189 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 13
  %190 = load i8, i8* %189, align 1
  %191 = xor i8 %190, %188
  store i8 %191, i8* %189, align 1
  %192 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 14
  %193 = load i8, i8* %192, align 2
  %194 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 14
  %195 = load i8, i8* %194, align 2
  %196 = xor i8 %195, %193
  store i8 %196, i8* %194, align 2
  %197 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 15
  %198 = load i8, i8* %197, align 1
  %199 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 15
  %200 = load i8, i8* %199, align 1
  %201 = xor i8 %200, %198
  store i8 %201, i8* %199, align 1
  %202 = call signext i16 @encrypt(i8* nonnull %14, i8* nonnull %8, %struct.aes* %2) #5
  %203 = call i64 @fwrite(i8* nonnull %8, i64 1, i64 16, %struct._IO_FILE* %1)
  %204 = icmp eq i64 %203, 16
  br i1 %204, label %207, label %205

; <label>:205:                                    ; preds = %.preheader
  %206 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0), i8* %3)
  br label %207

; <label>:207:                                    ; preds = %115, %.preheader, %205, %113
  %.0 = phi i32 [ -8, %205 ], [ -7, %113 ], [ 0, %.preheader ], [ 0, %115 ]
  ret i32 %.0
}

; Function Attrs: nounwind
declare i32 @fseek(%struct._IO_FILE* nocapture, i64, i32) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fgetpos(%struct._IO_FILE* nocapture, %struct._G_fpos_t* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @feof(%struct._IO_FILE* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fread(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #2

declare signext i16 @encrypt(i8*, i8*, %struct.aes*) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define i32 @decfile(%struct._IO_FILE* nocapture, %struct._IO_FILE* nocapture, %struct.aes*, i8*, i8*) local_unnamed_addr #1 {
  %6 = alloca [16 x i8], align 16
  %7 = alloca [16 x i8], align 16
  %8 = alloca [16 x i8], align 16
  %9 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 0
  %10 = call i64 @fread(i8* nonnull %9, i64 1, i64 16, %struct._IO_FILE* %0)
  %11 = icmp eq i64 %10, 16
  br i1 %11, label %14, label %12

; <label>:12:                                     ; preds = %5
  %13 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.1, i64 0, i64 0), i8* %3)
  br label %212

; <label>:14:                                     ; preds = %5
  %15 = getelementptr inbounds [16 x i8], [16 x i8]* %7, i64 0, i64 0
  %16 = call i64 @fread(i8* nonnull %15, i64 1, i64 16, %struct._IO_FILE* %0)
  %17 = trunc i64 %16 to i32
  switch i32 %17, label %18 [
    i32 0, label %20
    i32 16, label %20
  ]

; <label>:18:                                     ; preds = %14
  %19 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.2, i64 0, i64 0))
  br label %212

; <label>:20:                                     ; preds = %14, %14
  %21 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 0
  %22 = call signext i16 @decrypt(i8* nonnull %15, i8* nonnull %21, %struct.aes* %2) #5
  %23 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 0
  %24 = load i8, i8* %23, align 16
  %25 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 0
  %26 = load i8, i8* %25, align 16
  %27 = xor i8 %26, %24
  store i8 %27, i8* %25, align 16
  %28 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 1
  %29 = load i8, i8* %28, align 1
  %30 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 1
  %31 = load i8, i8* %30, align 1
  %32 = xor i8 %31, %29
  store i8 %32, i8* %30, align 1
  %33 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 2
  %34 = load i8, i8* %33, align 2
  %35 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 2
  %36 = load i8, i8* %35, align 2
  %37 = xor i8 %36, %34
  store i8 %37, i8* %35, align 2
  %38 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 3
  %39 = load i8, i8* %38, align 1
  %40 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 3
  %41 = load i8, i8* %40, align 1
  %42 = xor i8 %41, %39
  store i8 %42, i8* %40, align 1
  %43 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 4
  %44 = load i8, i8* %43, align 4
  %45 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 4
  %46 = load i8, i8* %45, align 4
  %47 = xor i8 %46, %44
  store i8 %47, i8* %45, align 4
  %48 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 5
  %49 = load i8, i8* %48, align 1
  %50 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 5
  %51 = load i8, i8* %50, align 1
  %52 = xor i8 %51, %49
  store i8 %52, i8* %50, align 1
  %53 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 6
  %54 = load i8, i8* %53, align 2
  %55 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 6
  %56 = load i8, i8* %55, align 2
  %57 = xor i8 %56, %54
  store i8 %57, i8* %55, align 2
  %58 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 7
  %59 = load i8, i8* %58, align 1
  %60 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 7
  %61 = load i8, i8* %60, align 1
  %62 = xor i8 %61, %59
  store i8 %62, i8* %60, align 1
  %63 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 8
  %64 = load i8, i8* %63, align 8
  %65 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 8
  %66 = load i8, i8* %65, align 8
  %67 = xor i8 %66, %64
  store i8 %67, i8* %65, align 8
  %68 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 9
  %69 = load i8, i8* %68, align 1
  %70 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 9
  %71 = load i8, i8* %70, align 1
  %72 = xor i8 %71, %69
  store i8 %72, i8* %70, align 1
  %73 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 10
  %74 = load i8, i8* %73, align 2
  %75 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 10
  %76 = load i8, i8* %75, align 2
  %77 = xor i8 %76, %74
  store i8 %77, i8* %75, align 2
  %78 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 11
  %79 = load i8, i8* %78, align 1
  %80 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 11
  %81 = load i8, i8* %80, align 1
  %82 = xor i8 %81, %79
  store i8 %82, i8* %80, align 1
  %83 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 12
  %84 = load i8, i8* %83, align 4
  %85 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 12
  %86 = load i8, i8* %85, align 4
  %87 = xor i8 %86, %84
  store i8 %87, i8* %85, align 4
  %88 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 13
  %89 = load i8, i8* %88, align 1
  %90 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 13
  %91 = load i8, i8* %90, align 1
  %92 = xor i8 %91, %89
  store i8 %92, i8* %90, align 1
  %93 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 14
  %94 = load i8, i8* %93, align 2
  %95 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 14
  %96 = load i8, i8* %95, align 2
  %97 = xor i8 %96, %94
  store i8 %97, i8* %95, align 2
  %98 = getelementptr inbounds [16 x i8], [16 x i8]* %6, i64 0, i64 15
  %99 = load i8, i8* %98, align 1
  %100 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 15
  %101 = load i8, i8* %100, align 1
  %102 = xor i8 %101, %99
  store i8 %102, i8* %100, align 1
  %103 = load i8, i8* %21, align 16
  %104 = and i8 %103, 15
  %105 = zext i8 %104 to i32
  %106 = call i64 @fread(i8* nonnull %9, i64 1, i64 16, %struct._IO_FILE* %0)
  %107 = trunc i64 %106 to i32
  %108 = icmp eq i32 %107, 16
  br i1 %108, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %20
  %109 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 16
  %110 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 0
  %111 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 1
  %112 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 2
  %113 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 3
  %114 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 4
  %115 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 5
  %116 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 6
  %117 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 7
  %118 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 8
  %119 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 9
  %120 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 10
  %121 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 11
  %122 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 12
  %123 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 13
  %124 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 14
  %125 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 15
  br label %126

; <label>:126:                                    ; preds = %.lr.ph, %.loopexit11
  %.019 = phi i64 [ 15, %.lr.ph ], [ 16, %.loopexit11 ]
  %.038 = phi i8* [ %15, %.lr.ph ], [ %.047, %.loopexit11 ]
  %.047 = phi i8* [ %9, %.lr.ph ], [ %.038, %.loopexit11 ]
  %127 = sub nsw i64 0, %.019
  %128 = getelementptr inbounds i8, i8* %109, i64 %127
  %129 = call i64 @fwrite(i8* %128, i64 1, i64 %.019, %struct._IO_FILE* %1)
  %130 = icmp eq i64 %129, %.019
  br i1 %130, label %.loopexit11, label %131

; <label>:131:                                    ; preds = %126
  %132 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0), i8* %4)
  br label %212

.loopexit11:                                      ; preds = %126
  %133 = call signext i16 @decrypt(i8* nonnull %.047, i8* nonnull %21, %struct.aes* %2) #5
  %134 = load i8, i8* %.038, align 1
  %135 = load i8, i8* %110, align 16
  %136 = xor i8 %135, %134
  store i8 %136, i8* %110, align 16
  %137 = getelementptr inbounds i8, i8* %.038, i64 1
  %138 = load i8, i8* %137, align 1
  %139 = load i8, i8* %111, align 1
  %140 = xor i8 %139, %138
  store i8 %140, i8* %111, align 1
  %141 = getelementptr inbounds i8, i8* %.038, i64 2
  %142 = load i8, i8* %141, align 1
  %143 = load i8, i8* %112, align 2
  %144 = xor i8 %143, %142
  store i8 %144, i8* %112, align 2
  %145 = getelementptr inbounds i8, i8* %.038, i64 3
  %146 = load i8, i8* %145, align 1
  %147 = load i8, i8* %113, align 1
  %148 = xor i8 %147, %146
  store i8 %148, i8* %113, align 1
  %149 = getelementptr inbounds i8, i8* %.038, i64 4
  %150 = load i8, i8* %149, align 1
  %151 = load i8, i8* %114, align 4
  %152 = xor i8 %151, %150
  store i8 %152, i8* %114, align 4
  %153 = getelementptr inbounds i8, i8* %.038, i64 5
  %154 = load i8, i8* %153, align 1
  %155 = load i8, i8* %115, align 1
  %156 = xor i8 %155, %154
  store i8 %156, i8* %115, align 1
  %157 = getelementptr inbounds i8, i8* %.038, i64 6
  %158 = load i8, i8* %157, align 1
  %159 = load i8, i8* %116, align 2
  %160 = xor i8 %159, %158
  store i8 %160, i8* %116, align 2
  %161 = getelementptr inbounds i8, i8* %.038, i64 7
  %162 = load i8, i8* %161, align 1
  %163 = load i8, i8* %117, align 1
  %164 = xor i8 %163, %162
  store i8 %164, i8* %117, align 1
  %165 = getelementptr inbounds i8, i8* %.038, i64 8
  %166 = load i8, i8* %165, align 1
  %167 = load i8, i8* %118, align 8
  %168 = xor i8 %167, %166
  store i8 %168, i8* %118, align 8
  %169 = getelementptr inbounds i8, i8* %.038, i64 9
  %170 = load i8, i8* %169, align 1
  %171 = load i8, i8* %119, align 1
  %172 = xor i8 %171, %170
  store i8 %172, i8* %119, align 1
  %173 = getelementptr inbounds i8, i8* %.038, i64 10
  %174 = load i8, i8* %173, align 1
  %175 = load i8, i8* %120, align 2
  %176 = xor i8 %175, %174
  store i8 %176, i8* %120, align 2
  %177 = getelementptr inbounds i8, i8* %.038, i64 11
  %178 = load i8, i8* %177, align 1
  %179 = load i8, i8* %121, align 1
  %180 = xor i8 %179, %178
  store i8 %180, i8* %121, align 1
  %181 = getelementptr inbounds i8, i8* %.038, i64 12
  %182 = load i8, i8* %181, align 1
  %183 = load i8, i8* %122, align 4
  %184 = xor i8 %183, %182
  store i8 %184, i8* %122, align 4
  %185 = getelementptr inbounds i8, i8* %.038, i64 13
  %186 = load i8, i8* %185, align 1
  %187 = load i8, i8* %123, align 1
  %188 = xor i8 %187, %186
  store i8 %188, i8* %123, align 1
  %189 = getelementptr inbounds i8, i8* %.038, i64 14
  %190 = load i8, i8* %189, align 1
  %191 = load i8, i8* %124, align 2
  %192 = xor i8 %191, %190
  store i8 %192, i8* %124, align 2
  %193 = getelementptr inbounds i8, i8* %.038, i64 15
  %194 = load i8, i8* %193, align 1
  %195 = load i8, i8* %125, align 1
  %196 = xor i8 %195, %194
  store i8 %196, i8* %125, align 1
  %197 = call i64 @fread(i8* %.038, i64 1, i64 16, %struct._IO_FILE* %0)
  %198 = trunc i64 %197 to i32
  %199 = icmp eq i32 %198, 16
  br i1 %199, label %126, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.loopexit11
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %20
  %.01.lcssa = phi i1 [ true, %20 ], [ false, %._crit_edge.loopexit ]
  %200 = xor i1 %.01.lcssa, true
  %201 = zext i1 %200 to i32
  %202 = add nuw nsw i32 %201, %105
  %203 = icmp eq i32 %202, 0
  br i1 %203, label %212, label %204

; <label>:204:                                    ; preds = %._crit_edge
  %205 = zext i1 %.01.lcssa to i64
  %206 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i64 0, i64 %205
  %207 = zext i32 %202 to i64
  %208 = call i64 @fwrite(i8* %206, i64 1, i64 %207, %struct._IO_FILE* %1)
  %209 = icmp eq i64 %208, %207
  br i1 %209, label %212, label %210

; <label>:210:                                    ; preds = %204
  %211 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0), i8* %4)
  br label %212

; <label>:212:                                    ; preds = %._crit_edge, %204, %210, %131, %18, %12
  %.0 = phi i32 [ 9, %12 ], [ -10, %18 ], [ -12, %210 ], [ -11, %131 ], [ 0, %204 ], [ 0, %._crit_edge ]
  ret i32 %.0
}

declare signext i16 @decrypt(i8*, i8*, %struct.aes*) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable
define i32 @main1(i32, i8** nocapture readonly) local_unnamed_addr #1 {
  %3 = alloca [32 x i8], align 16
  %4 = alloca [1 x %struct.aes], align 16
  %5 = icmp eq i32 %0, 5
  br i1 %5, label %6, label %13

; <label>:6:                                      ; preds = %2
  %7 = getelementptr inbounds i8*, i8** %1, i64 3
  %8 = load i8*, i8** %7, align 8
  %9 = load i8, i8* %8, align 1
  %10 = sext i8 %9 to i32
  %11 = tail call i32 @toupper(i32 %10) #7
  %12 = and i32 %11, -2
  %switch = icmp eq i32 %12, 68
  br i1 %switch, label %14, label %13

; <label>:13:                                     ; preds = %6, %2
  %puts14 = tail call i32 @puts(i8* getelementptr inbounds ([58 x i8], [58 x i8]* @str.3, i64 0, i64 0))
  br label %.thread

; <label>:14:                                     ; preds = %6
  %15 = getelementptr inbounds i8*, i8** %1, i64 4
  %16 = load i8*, i8** %15, align 8
  %17 = load i8, i8* %16, align 1
  %18 = icmp eq i8 %17, 0
  br label %19

; <label>:19:                                     ; preds = %14, %.backedge
  %20 = phi i1 [ %18, %14 ], [ %41, %.backedge ]
  %21 = phi i8 [ %17, %14 ], [ %40, %.backedge ]
  %.0337 = phi i8* [ %16, %14 ], [ %23, %.backedge ]
  %.0436 = phi i32 [ 0, %14 ], [ %35, %.backedge ]
  %.0635 = phi i32 [ 0, %14 ], [ %36, %.backedge ]
  br i1 %20, label %.critedge.thread.loopexit, label %22

; <label>:22:                                     ; preds = %19
  %23 = getelementptr inbounds i8, i8* %.0337, i64 1
  %24 = sext i8 %21 to i32
  %25 = tail call i32 @toupper(i32 %24) #7
  %26 = trunc i32 %25 to i8
  %.off = add i8 %26, -48
  %27 = icmp ult i8 %.off, 10
  br i1 %27, label %31, label %28

; <label>:28:                                     ; preds = %22
  %.off29 = add i8 %26, -65
  %29 = icmp ult i8 %.off29, 6
  br i1 %29, label %31, label %30

; <label>:30:                                     ; preds = %28
  %puts9 = tail call i32 @puts(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @str.2, i64 0, i64 0))
  br label %.thread

; <label>:31:                                     ; preds = %22, %28
  %.sink16 = phi i32 [ -55, %28 ], [ -48, %22 ]
  %32 = shl i32 %.0436, 4
  %sext11 = shl i32 %25, 24
  %33 = ashr exact i32 %sext11, 24
  %34 = add nsw i32 %33, %32
  %35 = add nsw i32 %34, %.sink16
  %36 = add nuw nsw i32 %.0635, 1
  %37 = and i32 %.0635, 1
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %.backedge, label %42

.backedge:                                        ; preds = %31, %42
  %39 = icmp slt i32 %36, 64
  %40 = load i8, i8* %23, align 1
  %41 = icmp eq i8 %40, 0
  br i1 %39, label %19, label %.critedge

; <label>:42:                                     ; preds = %31
  %43 = trunc i32 %35 to i8
  %44 = sdiv i32 %36, 2
  %45 = add nsw i32 %44, -1
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 %46
  store i8 %43, i8* %47, align 1
  br label %.backedge

.critedge:                                        ; preds = %.backedge
  br i1 %41, label %.critedge.thread, label %48

; <label>:48:                                     ; preds = %.critedge
  %puts7 = tail call i32 @puts(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @str.1, i64 0, i64 0))
  br label %.thread

.critedge.thread.loopexit:                        ; preds = %19
  br label %.critedge.thread

.critedge.thread:                                 ; preds = %.critedge.thread.loopexit, %.critedge
  %.0634 = phi i32 [ %36, %.critedge ], [ %.0635, %.critedge.thread.loopexit ]
  %49 = icmp sgt i32 %.0634, 31
  %50 = and i32 %.0634, 15
  %51 = icmp eq i32 %50, 0
  %or.cond22 = and i1 %49, %51
  br i1 %or.cond22, label %53, label %52

; <label>:52:                                     ; preds = %.critedge.thread
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @str, i64 0, i64 0))
  br label %.thread

; <label>:53:                                     ; preds = %.critedge.thread
  %54 = lshr i32 %.0634, 1
  %55 = getelementptr inbounds i8*, i8** %1, i64 1
  %56 = load i8*, i8** %55, align 8
  %57 = tail call %struct._IO_FILE* @fopen(i8* %56, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0))
  %58 = icmp eq %struct._IO_FILE* %57, null
  br i1 %58, label %59, label %62

; <label>:59:                                     ; preds = %53
  %60 = load i8*, i8** %55, align 8
  %61 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.8, i64 0, i64 0), i8* %60)
  br label %.thread

; <label>:62:                                     ; preds = %53
  %63 = getelementptr inbounds i8*, i8** %1, i64 2
  %64 = load i8*, i8** %63, align 8
  %65 = tail call %struct._IO_FILE* @fopen(i8* %64, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0))
  %66 = icmp eq %struct._IO_FILE* %65, null
  br i1 %66, label %86, label %67

; <label>:67:                                     ; preds = %62
  %68 = load i8*, i8** %7, align 8
  %69 = load i8, i8* %68, align 1
  %70 = sext i8 %69 to i32
  %71 = tail call i32 @toupper(i32 %70) #7
  %72 = icmp eq i32 %71, 69
  %73 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 0
  %74 = zext i32 %54 to i64
  %75 = getelementptr inbounds [1 x %struct.aes], [1 x %struct.aes]* %4, i64 0, i64 0
  br i1 %72, label %76, label %80

; <label>:76:                                     ; preds = %67
  %77 = call signext i16 @set_key(i8* nonnull %73, i64 %74, i32 1, %struct.aes* nonnull %75) #5
  %78 = load i8*, i8** %55, align 8
  %79 = call i32 @encfile(%struct._IO_FILE* nonnull %57, %struct._IO_FILE* nonnull %65, %struct.aes* nonnull %75, i8* %78)
  br label %.thread25

; <label>:80:                                     ; preds = %67
  %81 = call signext i16 @set_key(i8* nonnull %73, i64 %74, i32 2, %struct.aes* nonnull %75) #5
  %82 = load i8*, i8** %55, align 8
  %83 = load i8*, i8** %63, align 8
  %84 = call i32 @decfile(%struct._IO_FILE* nonnull %57, %struct._IO_FILE* nonnull %65, %struct.aes* nonnull %75, i8* %82, i8* %83)
  br label %.thread25

.thread25:                                        ; preds = %76, %80
  %.1 = phi i32 [ %79, %76 ], [ %84, %80 ]
  %85 = call i32 @fclose(%struct._IO_FILE* nonnull %65)
  br label %89

; <label>:86:                                     ; preds = %62
  %87 = load i8*, i8** %55, align 8
  %88 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.10, i64 0, i64 0), i8* %87)
  br label %89

; <label>:89:                                     ; preds = %86, %.thread25
  %.12426 = phi i32 [ %.1, %.thread25 ], [ -6, %86 ]
  %90 = call i32 @fclose(%struct._IO_FILE* nonnull %57)
  br label %.thread

.thread:                                          ; preds = %13, %30, %48, %52, %59, %89
  %.12427 = phi i32 [ %.12426, %89 ], [ -1, %13 ], [ -2, %30 ], [ -3, %48 ], [ -4, %52 ], [ -5, %59 ]
  ret i32 %.12427
}

; Function Attrs: nounwind readonly
declare i32 @toupper(i32) local_unnamed_addr #4

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #2

declare signext i16 @set_key(i8*, i64, i32, %struct.aes*) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #5

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #6

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { argmemonly nounwind }
attributes #7 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
