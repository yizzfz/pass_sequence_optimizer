; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  call fastcc void @init_array([2000 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_ludcmp([2000 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %17

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to double*
  call fastcc void @print_array(double* %16)
  br label %17

; <label>:17:                                     ; preds = %12, %2, %15
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
.lr.ph55.preheader110:
  br label %.lr.ph55

.lr.ph55:                                         ; preds = %.lr.ph55, %.lr.ph55.preheader110
  %indvars.iv100 = phi i64 [ 0, %.lr.ph55.preheader110 ], [ %indvars.iv.next101.1, %.lr.ph55 ]
  %4 = getelementptr inbounds double, double* %2, i64 %indvars.iv100
  %5 = bitcast double* %4 to <2 x double>*
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv100
  %7 = bitcast double* %6 to <2 x double>*
  %indvars.iv.next101 = or i64 %indvars.iv100, 1
  %8 = trunc i64 %indvars.iv.next101 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds double, double* %1, i64 %indvars.iv100
  store <2 x double> zeroinitializer, <2 x double>* %5, align 8
  store <2 x double> zeroinitializer, <2 x double>* %7, align 8
  %indvars.iv.next101.1 = add nuw nsw i64 %indvars.iv100, 2
  %11 = trunc i64 %indvars.iv.next101.1 to i32
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %9, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fdiv <2 x double> %14, <double 2.000000e+03, double 2.000000e+03>
  %16 = fmul <2 x double> %15, <double 5.000000e-01, double 5.000000e-01>
  %17 = fadd <2 x double> %16, <double 4.000000e+00, double 4.000000e+00>
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %exitcond103.1 = icmp eq i64 %indvars.iv.next101.1, 2000
  br i1 %exitcond103.1, label %.lr.ph55..lr.ph42_crit_edge, label %.lr.ph55

.lr.ph55..lr.ph42_crit_edge:                      ; preds = %.lr.ph55
  br label %.lr.ph42

.lr.ph42:                                         ; preds = %._crit_edge48..lr.ph42_crit_edge, %.lr.ph55..lr.ph42_crit_edge
  %indvars.iv96 = phi i64 [ %indvars.iv.next97, %._crit_edge48..lr.ph42_crit_edge ], [ 0, %.lr.ph55..lr.ph42_crit_edge ]
  %indvars.iv94 = phi i64 [ %indvars.iv.next95, %._crit_edge48..lr.ph42_crit_edge ], [ 1, %.lr.ph55..lr.ph42_crit_edge ]
  br label %19

; <label>:19:                                     ; preds = %19, %.lr.ph42
  %indvars.iv78 = phi i64 [ 0, %.lr.ph42 ], [ %indvars.iv.next79, %19 ]
  %20 = sub nsw i64 0, %indvars.iv78
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, 2000
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, 2.000000e+03
  %25 = fadd double %24, 1.000000e+00
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv96, i64 %indvars.iv78
  store double %25, double* %26, align 8
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next79, %indvars.iv94
  br i1 %exitcond83, label %._crit_edge43, label %19

._crit_edge43:                                    ; preds = %19
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  %27 = icmp slt i64 %indvars.iv.next97, 2000
  br i1 %27, label %.lr.ph47, label %._crit_edge48

.lr.ph47:                                         ; preds = %._crit_edge43
  %28 = mul nuw nsw i64 %indvars.iv96, 2001
  %29 = sub i64 1998, %indvars.iv96
  %30 = shl i64 %29, 3
  %31 = and i64 %30, 34359738360
  %32 = add nuw nsw i64 %31, 8
  %33 = add nuw nsw i64 %28, 1
  %scevgep92 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %33
  %34 = bitcast double* %scevgep92 to i8*
  call void @llvm.memset.p0i8.i64(i8* %34, i8 0, i64 %32, i32 8, i1 false)
  br label %._crit_edge48

._crit_edge48:                                    ; preds = %._crit_edge43, %.lr.ph47
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv96, i64 %indvars.iv96
  store double 1.000000e+00, double* %35, align 8
  %exitcond106 = icmp eq i64 %indvars.iv.next97, 2000
  br i1 %exitcond106, label %.lr.ph38.split.us.preheader, label %._crit_edge48..lr.ph42_crit_edge

._crit_edge48..lr.ph42_crit_edge:                 ; preds = %._crit_edge48
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94, 1
  br label %.lr.ph42

.lr.ph38.split.us.preheader:                      ; preds = %._crit_edge48
  %36 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge35.us.3

.lr.ph16.us.us.preheader:                         ; preds = %._crit_edge21.us, %._crit_edge35.us.3..lr.ph16.us.us.preheader_crit_edge
  %indvars.iv113 = phi i64 [ 0, %._crit_edge35.us.3..lr.ph16.us.us.preheader_crit_edge ], [ %indvars.iv.next114, %._crit_edge21.us ]
  br label %.lr.ph16.us.us.new.preheader

._crit_edge21.us:                                 ; preds = %._crit_edge17.us.us
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %exitcond2 = icmp ne i64 %indvars.iv.next114, 2000
  br i1 %exitcond2, label %.lr.ph16.us.us.preheader, label %._crit_edge21.us..lr.ph12.split.us_crit_edge

._crit_edge21.us..lr.ph12.split.us_crit_edge:     ; preds = %._crit_edge21.us
  %37 = bitcast i8* %36 to [2000 x [2000 x double]]*
  br label %.lr.ph12.split.us

.lr.ph16.us.us.new.preheader:                     ; preds = %._crit_edge17.us.us, %.lr.ph16.us.us.preheader
  %indvars.iv111 = phi i64 [ 0, %.lr.ph16.us.us.preheader ], [ %indvars.iv.next112, %._crit_edge17.us.us ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv111, i64 %indvars.iv113
  br label %.lr.ph16.us.us.new

._crit_edge17.us.us:                              ; preds = %.lr.ph16.us.us.new
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  %exitcond1 = icmp ne i64 %indvars.iv.next112, 2000
  br i1 %exitcond1, label %.lr.ph16.us.us.new.preheader, label %._crit_edge21.us

.lr.ph16.us.us.new:                               ; preds = %.lr.ph16.us.us.new, %.lr.ph16.us.us.new.preheader
  %indvars.iv59 = phi i64 [ 0, %.lr.ph16.us.us.new.preheader ], [ %indvars.iv.next60.1, %.lr.ph16.us.us.new ]
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %indvars.iv113
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %78, i64 0, i64 %indvars.iv111, i64 %indvars.iv59
  %44 = load double, double* %43, align 8
  %45 = fadd double %44, %42
  store double %45, double* %43, align 8
  %indvars.iv.next60 = or i64 %indvars.iv59, 1
  %46 = load double, double* %38, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next60, i64 %indvars.iv113
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %78, i64 0, i64 %indvars.iv111, i64 %indvars.iv.next60
  %51 = load double, double* %50, align 8
  %52 = fadd double %51, %49
  store double %52, double* %50, align 8
  %indvars.iv.next60.1 = add nuw nsw i64 %indvars.iv59, 2
  %exitcond62.1 = icmp eq i64 %indvars.iv.next60.1, 2000
  br i1 %exitcond62.1, label %._crit_edge17.us.us, label %.lr.ph16.us.us.new

.lr.ph12.split.us:                                ; preds = %._crit_edge.us, %._crit_edge21.us..lr.ph12.split.us_crit_edge
  %indvar = phi i32 [ 0, %._crit_edge21.us..lr.ph12.split.us_crit_edge ], [ %indvar.next, %._crit_edge.us ]
  %53 = sext i32 %indvar to i64
  br label %.lr.ph12.split.us.new

.lr.ph12.split.us.new:                            ; preds = %.lr.ph12.split.us.new, %.lr.ph12.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph12.split.us ], [ %indvars.iv.next.3, %.lr.ph12.split.us.new ]
  %54 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %53, i64 %indvars.iv
  %55 = bitcast double* %54 to i64*
  %56 = load i64, i64* %55, align 8
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %53, i64 %indvars.iv
  %58 = bitcast double* %57 to i64*
  store i64 %56, i64* %58, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %59 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %53, i64 %indvars.iv.next
  %60 = bitcast double* %59 to i64*
  %61 = load i64, i64* %60, align 8
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %53, i64 %indvars.iv.next
  %63 = bitcast double* %62 to i64*
  store i64 %61, i64* %63, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %64 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %53, i64 %indvars.iv.next.1
  %65 = bitcast double* %64 to i64*
  %66 = load i64, i64* %65, align 8
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %53, i64 %indvars.iv.next.1
  %68 = bitcast double* %67 to i64*
  store i64 %66, i64* %68, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %69 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %53, i64 %indvars.iv.next.2
  %70 = bitcast double* %69 to i64*
  %71 = load i64, i64* %70, align 8
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %53, i64 %indvars.iv.next.2
  %73 = bitcast double* %72 to i64*
  store i64 %71, i64* %73, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %._crit_edge.us, label %.lr.ph12.split.us.new

._crit_edge.us:                                   ; preds = %.lr.ph12.split.us.new
  %indvar.next = add nuw i32 %indvar, 1
  %exitcond = icmp eq i32 %indvar.next, 2000
  br i1 %exitcond, label %._crit_edge13, label %.lr.ph12.split.us

._crit_edge13:                                    ; preds = %._crit_edge.us
  call void @free(i8* %36) #4
  ret void

._crit_edge35.us.3:                               ; preds = %._crit_edge35.us.3, %.lr.ph38.split.us.preheader
  %indvar71 = phi i64 [ 0, %.lr.ph38.split.us.preheader ], [ %indvar.next72.3, %._crit_edge35.us.3 ]
  %74 = mul nuw nsw i64 %indvar71, 16000
  %scevgep = getelementptr i8, i8* %36, i64 %74
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %75 = add nuw nsw i64 %74, 16000
  %scevgep.1 = getelementptr i8, i8* %36, i64 %75
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %76 = add nuw nsw i64 %74, 32000
  %scevgep.2 = getelementptr i8, i8* %36, i64 %76
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %77 = add nuw nsw i64 %74, 48000
  %scevgep.3 = getelementptr i8, i8* %36, i64 %77
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next72.3 = add nuw nsw i64 %indvar71, 4
  %exitcond74.3 = icmp eq i64 %indvar.next72.3, 2000
  br i1 %exitcond74.3, label %._crit_edge35.us.3..lr.ph16.us.us.preheader_crit_edge, label %._crit_edge35.us.3

._crit_edge35.us.3..lr.ph16.us.us.preheader_crit_edge: ; preds = %._crit_edge35.us.3
  %78 = bitcast i8* %36 to [2000 x [2000 x double]]*
  br label %.lr.ph16.us.us.preheader
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
.lr.ph52.preheader:
  br label %.lr.ph52

.lr.ph52:                                         ; preds = %._crit_edge47..lr.ph52_crit_edge, %.lr.ph52.preheader
  %indvars.iv161 = phi i64 [ %indvars.iv.next162, %._crit_edge47..lr.ph52_crit_edge ], [ 0, %.lr.ph52.preheader ]
  %indvars.iv141 = phi i2 [ %indvars.iv.next142, %._crit_edge47..lr.ph52_crit_edge ], [ 0, %.lr.ph52.preheader ]
  %indvars.iv139 = phi i64 [ %indvars.iv.next140, %._crit_edge47..lr.ph52_crit_edge ], [ 1, %.lr.ph52.preheader ]
  %indvars.iv118 = phi i64 [ %indvars.iv.next119, %._crit_edge47..lr.ph52_crit_edge ], [ 0, %.lr.ph52.preheader ]
  %sext = shl i64 %indvars.iv161, 32
  %4 = ashr exact i64 %sext, 32
  %5 = zext i2 %indvars.iv141 to i64
  %6 = add nuw nsw i64 %5, 4294967295
  %7 = and i64 %6, 4294967295
  %8 = add i64 %indvars.iv139, %7
  %9 = add nuw i64 %indvars.iv118, 4294967295
  %10 = sub i64 4294969295, %indvars.iv118
  %11 = trunc i64 %10 to i32
  %12 = icmp sgt i64 %indvars.iv118, 0
  br i1 %12, label %.lr.ph36.preheader, label %.lr.ph46.split.preheader

.lr.ph36.preheader:                               ; preds = %.lr.ph52
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv118, i64 0
  br label %.lr.ph36

.lr.ph36:                                         ; preds = %._crit_edge32, %.lr.ph36.preheader
  %indvars.iv91 = phi i64 [ 0, %.lr.ph36.preheader ], [ %indvars.iv.next92, %._crit_edge32 ]
  %14 = add nuw i64 %indvars.iv91, 4294967295
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv118, i64 %indvars.iv91
  %16 = load double, double* %15, align 8
  %17 = icmp sgt i64 %indvars.iv91, 0
  br i1 %17, label %.lr.ph31, label %._crit_edge32

.lr.ph31:                                         ; preds = %.lr.ph36
  %xtraiter87150 = and i64 %indvars.iv91, 1
  %lcmp.mod88 = icmp eq i64 %xtraiter87150, 0
  br i1 %lcmp.mod88, label %.prol.loopexit86, label %18

; <label>:18:                                     ; preds = %.lr.ph31
  %19 = load double, double* %13, align 8
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv91
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fsub double %16, %22
  br label %.prol.loopexit86

.prol.loopexit86:                                 ; preds = %.lr.ph31, %18
  %indvars.iv80.unr.ph = phi i64 [ 1, %18 ], [ 0, %.lr.ph31 ]
  %.029.unr.ph = phi double [ %23, %18 ], [ %16, %.lr.ph31 ]
  %.lcssa60.unr.ph = phi double [ %23, %18 ], [ undef, %.lr.ph31 ]
  %24 = trunc i64 %14 to i32
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %._crit_edge32, label %.prol.loopexit86..lr.ph31.new_crit_edge

.prol.loopexit86..lr.ph31.new_crit_edge:          ; preds = %.prol.loopexit86
  br label %.lr.ph31.new

.lr.ph31.new:                                     ; preds = %.lr.ph31.new, %.prol.loopexit86..lr.ph31.new_crit_edge
  %indvars.iv80 = phi i64 [ %indvars.iv80.unr.ph, %.prol.loopexit86..lr.ph31.new_crit_edge ], [ %indvars.iv.next81.1, %.lr.ph31.new ]
  %.029 = phi double [ %.029.unr.ph, %.prol.loopexit86..lr.ph31.new_crit_edge ], [ %39, %.lr.ph31.new ]
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv118, i64 %indvars.iv80
  %27 = bitcast double* %26 to <2 x double>*
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv80, i64 %indvars.iv91
  %29 = load double, double* %28, align 8
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %30 = load <2 x double>, <2 x double>* %27, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next81, i64 %indvars.iv91
  %32 = load double, double* %31, align 8
  %33 = insertelement <2 x double> undef, double %29, i32 0
  %34 = insertelement <2 x double> %33, double %32, i32 1
  %35 = fmul <2 x double> %30, %34
  %36 = extractelement <2 x double> %35, i32 0
  %37 = extractelement <2 x double> %35, i32 1
  %38 = fsub double %.029, %36
  %39 = fsub double %38, %37
  %indvars.iv.next81.1 = add nuw nsw i64 %indvars.iv80, 2
  %exitcond84.1 = icmp eq i64 %indvars.iv.next81.1, %indvars.iv91
  br i1 %exitcond84.1, label %._crit_edge32.loopexit, label %.lr.ph31.new

._crit_edge32.loopexit:                           ; preds = %.lr.ph31.new
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %._crit_edge32.loopexit, %.prol.loopexit86, %.lr.ph36
  %.0.lcssa = phi double [ %16, %.lr.ph36 ], [ %.lcssa60.unr.ph, %.prol.loopexit86 ], [ %39, %._crit_edge32.loopexit ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv91, i64 %indvars.iv91
  %41 = load double, double* %40, align 8
  %42 = fdiv double %.0.lcssa, %41
  store double %42, double* %15, align 8
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next92, %indvars.iv118
  br i1 %exitcond96, label %.lr.ph46.split.us.preheader, label %.lr.ph36

.lr.ph46.split.preheader:                         ; preds = %.lr.ph52
  %43 = sub i64 2000, %indvars.iv118
  %44 = trunc i64 %43 to i32
  %xtraiter103 = and i32 %44, 3
  %lcmp.mod104 = icmp eq i32 %xtraiter103, 0
  br i1 %lcmp.mod104, label %.lr.ph46.split.prol.loopexit, label %.lr.ph46.split.preheader..lr.ph46.split.prol_crit_edge

.lr.ph46.split.preheader..lr.ph46.split.prol_crit_edge: ; preds = %.lr.ph46.split.preheader
  br label %.lr.ph46.split.prol

.lr.ph46.split.prol:                              ; preds = %.lr.ph46.split.prol, %.lr.ph46.split.preheader..lr.ph46.split.prol_crit_edge
  %prol.iter105 = phi i32 [ %xtraiter103, %.lr.ph46.split.preheader..lr.ph46.split.prol_crit_edge ], [ %prol.iter105.sub, %.lr.ph46.split.prol ]
  %prol.iter105.sub = add nsw i32 %prol.iter105, -1
  %prol.iter105.cmp = icmp eq i32 %prol.iter105.sub, 0
  br i1 %prol.iter105.cmp, label %.lr.ph46.split.prol.loopexit.loopexit, label %.lr.ph46.split.prol, !llvm.loop !1

.lr.ph46.split.prol.loopexit.loopexit:            ; preds = %.lr.ph46.split.prol
  br label %.lr.ph46.split.prol.loopexit

.lr.ph46.split.prol.loopexit:                     ; preds = %.lr.ph46.split.prol.loopexit.loopexit, %.lr.ph46.split.preheader
  %indvars.iv99.unr = phi i64 [ %indvars.iv118, %.lr.ph46.split.preheader ], [ %8, %.lr.ph46.split.prol.loopexit.loopexit ]
  %45 = icmp ult i32 %11, 3
  br i1 %45, label %._crit_edge47, label %.lr.ph46.split.prol.loopexit..lr.ph46.split_crit_edge

.lr.ph46.split.prol.loopexit..lr.ph46.split_crit_edge: ; preds = %.lr.ph46.split.prol.loopexit
  br label %.lr.ph46.split

.lr.ph46.split.us.preheader:                      ; preds = %._crit_edge32
  %xtraiter114149 = and i64 %indvars.iv118, 1
  %46 = trunc i64 %9 to i32
  %47 = icmp eq i64 %xtraiter114149, 0
  %48 = icmp eq i32 %46, 0
  br label %.lr.ph46.split.us

.lr.ph46.split.us:                                ; preds = %._crit_edge42.us, %.lr.ph46.split.us.preheader
  %indvars.iv163 = phi i64 [ %4, %.lr.ph46.split.us.preheader ], [ %indvars.iv.next164, %._crit_edge42.us ]
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv118, i64 %indvars.iv163
  %50 = load double, double* %49, align 8
  br i1 %47, label %.prol.loopexit113, label %51

; <label>:51:                                     ; preds = %.lr.ph46.split.us
  %52 = load double, double* %13, align 8
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv163
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = fsub double %50, %55
  br label %.prol.loopexit113

.prol.loopexit113:                                ; preds = %.lr.ph46.split.us, %51
  %indvars.iv106.unr.ph = phi i64 [ 1, %51 ], [ 0, %.lr.ph46.split.us ]
  %.139.us.unr.ph = phi double [ %56, %51 ], [ %50, %.lr.ph46.split.us ]
  %.lcssa61.unr.ph = phi double [ %56, %51 ], [ undef, %.lr.ph46.split.us ]
  br i1 %48, label %._crit_edge42.us, label %.prol.loopexit113..lr.ph46.split.us.new_crit_edge

.prol.loopexit113..lr.ph46.split.us.new_crit_edge: ; preds = %.prol.loopexit113
  br label %.lr.ph46.split.us.new

.lr.ph46.split.us.new:                            ; preds = %.lr.ph46.split.us.new, %.prol.loopexit113..lr.ph46.split.us.new_crit_edge
  %indvars.iv106 = phi i64 [ %indvars.iv106.unr.ph, %.prol.loopexit113..lr.ph46.split.us.new_crit_edge ], [ %indvars.iv.next107.1, %.lr.ph46.split.us.new ]
  %.139.us = phi double [ %.139.us.unr.ph, %.prol.loopexit113..lr.ph46.split.us.new_crit_edge ], [ %70, %.lr.ph46.split.us.new ]
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv118, i64 %indvars.iv106
  %58 = bitcast double* %57 to <2 x double>*
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv106, i64 %indvars.iv163
  %60 = load double, double* %59, align 8
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1
  %61 = load <2 x double>, <2 x double>* %58, align 8
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next107, i64 %indvars.iv163
  %63 = load double, double* %62, align 8
  %64 = insertelement <2 x double> undef, double %60, i32 0
  %65 = insertelement <2 x double> %64, double %63, i32 1
  %66 = fmul <2 x double> %61, %65
  %67 = extractelement <2 x double> %66, i32 0
  %68 = extractelement <2 x double> %66, i32 1
  %69 = fsub double %.139.us, %67
  %70 = fsub double %69, %68
  %indvars.iv.next107.1 = add nuw nsw i64 %indvars.iv106, 2
  %exitcond111.1 = icmp eq i64 %indvars.iv.next107.1, %indvars.iv118
  br i1 %exitcond111.1, label %._crit_edge42.us.loopexit, label %.lr.ph46.split.us.new

._crit_edge42.us.loopexit:                        ; preds = %.lr.ph46.split.us.new
  br label %._crit_edge42.us

._crit_edge42.us:                                 ; preds = %._crit_edge42.us.loopexit, %.prol.loopexit113
  %.lcssa61 = phi double [ %.lcssa61.unr.ph, %.prol.loopexit113 ], [ %70, %._crit_edge42.us.loopexit ]
  store double %.lcssa61, double* %49, align 8
  %indvars.iv.next164 = add nsw i64 %indvars.iv163, 1
  %71 = icmp slt i64 %indvars.iv.next164, 2000
  br i1 %71, label %.lr.ph46.split.us, label %._crit_edge47.loopexit

.lr.ph46.split:                                   ; preds = %.lr.ph46.split, %.lr.ph46.split.prol.loopexit..lr.ph46.split_crit_edge
  %indvars.iv99 = phi i64 [ %indvars.iv99.unr, %.lr.ph46.split.prol.loopexit..lr.ph46.split_crit_edge ], [ %indvars.iv.next100.3, %.lr.ph46.split ]
  %indvars.iv.next100.3 = add nsw i64 %indvars.iv99, 4
  %exitcond101.3 = icmp eq i64 %indvars.iv.next100.3, 2000
  br i1 %exitcond101.3, label %._crit_edge47.loopexit11, label %.lr.ph46.split

._crit_edge47.loopexit:                           ; preds = %._crit_edge42.us
  br label %._crit_edge47

._crit_edge47.loopexit11:                         ; preds = %.lr.ph46.split
  br label %._crit_edge47

._crit_edge47:                                    ; preds = %._crit_edge47.loopexit11, %._crit_edge47.loopexit, %.lr.ph46.split.prol.loopexit
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %exitcond = icmp eq i64 %indvars.iv.next119, 2000
  br i1 %exitcond, label %._crit_edge47..lr.ph26_crit_edge, label %._crit_edge47..lr.ph52_crit_edge

._crit_edge47..lr.ph52_crit_edge:                 ; preds = %._crit_edge47
  %indvars.iv.next162 = add nsw i64 %4, 1
  %indvars.iv.next142 = add i2 %indvars.iv141, -1
  %indvars.iv.next140 = add nuw i64 %indvars.iv139, 1
  br label %.lr.ph52

._crit_edge47..lr.ph26_crit_edge:                 ; preds = %._crit_edge47
  br label %.lr.ph26

.lr.ph26:                                         ; preds = %._crit_edge22..lr.ph26_crit_edge, %._crit_edge47..lr.ph26_crit_edge
  %indvars.iv136 = phi i2 [ %indvars.iv.next137, %._crit_edge22..lr.ph26_crit_edge ], [ 0, %._crit_edge47..lr.ph26_crit_edge ]
  %indvars.iv77 = phi i64 [ %indvars.iv.next78, %._crit_edge22..lr.ph26_crit_edge ], [ 0, %._crit_edge47..lr.ph26_crit_edge ]
  %72 = zext i2 %indvars.iv136 to i64
  %73 = add nuw nsw i64 %72, 4294967295
  %74 = and i64 %73, 4294967295
  %75 = add nuw nsw i64 %74, 1
  %76 = add nuw i64 %indvars.iv77, 4294967295
  %77 = getelementptr inbounds double, double* %1, i64 %indvars.iv77
  %78 = load double, double* %77, align 8
  %79 = icmp sgt i64 %indvars.iv77, 0
  br i1 %79, label %.lr.ph21, label %._crit_edge22

.lr.ph21:                                         ; preds = %.lr.ph26
  %80 = trunc i64 %indvars.iv77 to i32
  %xtraiter70 = and i32 %80, 3
  %lcmp.mod71 = icmp eq i32 %xtraiter70, 0
  br i1 %lcmp.mod71, label %.prol.loopexit69, label %.lr.ph21..prol.preheader68_crit_edge

.lr.ph21..prol.preheader68_crit_edge:             ; preds = %.lr.ph21
  br label %.prol.preheader68

.prol.preheader68:                                ; preds = %.prol.preheader68..prol.preheader68_crit_edge, %.lr.ph21..prol.preheader68_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader68..prol.preheader68_crit_edge ], [ 0, %.lr.ph21..prol.preheader68_crit_edge ]
  %.219.prol = phi double [ %86, %.prol.preheader68..prol.preheader68_crit_edge ], [ %78, %.lr.ph21..prol.preheader68_crit_edge ]
  %prol.iter73 = phi i32 [ %prol.iter73.sub, %.prol.preheader68..prol.preheader68_crit_edge ], [ %xtraiter70, %.lr.ph21..prol.preheader68_crit_edge ]
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv77, i64 %indvars.iv.prol
  %82 = load double, double* %81, align 8
  %83 = getelementptr inbounds double, double* %3, i64 %indvars.iv.prol
  %84 = load double, double* %83, align 8
  %85 = fmul double %82, %84
  %86 = fsub double %.219.prol, %85
  %prol.iter73.sub = add nsw i32 %prol.iter73, -1
  %prol.iter73.cmp = icmp eq i32 %prol.iter73.sub, 0
  br i1 %prol.iter73.cmp, label %.prol.loopexit69.loopexit, label %.prol.preheader68..prol.preheader68_crit_edge, !llvm.loop !3

.prol.preheader68..prol.preheader68_crit_edge:    ; preds = %.prol.preheader68
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %.prol.preheader68

.prol.loopexit69.loopexit:                        ; preds = %.prol.preheader68
  br label %.prol.loopexit69

.prol.loopexit69:                                 ; preds = %.prol.loopexit69.loopexit, %.lr.ph21
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph21 ], [ %75, %.prol.loopexit69.loopexit ]
  %.219.unr = phi double [ %78, %.lr.ph21 ], [ %86, %.prol.loopexit69.loopexit ]
  %.lcssa59.unr = phi double [ undef, %.lr.ph21 ], [ %86, %.prol.loopexit69.loopexit ]
  %87 = trunc i64 %76 to i32
  %88 = icmp ult i32 %87, 3
  br i1 %88, label %._crit_edge22, label %.prol.loopexit69..lr.ph21.new_crit_edge

.prol.loopexit69..lr.ph21.new_crit_edge:          ; preds = %.prol.loopexit69
  br label %.lr.ph21.new

.lr.ph21.new:                                     ; preds = %.lr.ph21.new, %.prol.loopexit69..lr.ph21.new_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.unr, %.prol.loopexit69..lr.ph21.new_crit_edge ], [ %indvars.iv.next.3, %.lr.ph21.new ]
  %.219 = phi double [ %.219.unr, %.prol.loopexit69..lr.ph21.new_crit_edge ], [ %110, %.lr.ph21.new ]
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv77, i64 %indvars.iv
  %90 = bitcast double* %89 to <2 x double>*
  %91 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %92 = bitcast double* %91 to <2 x double>*
  %93 = load <2 x double>, <2 x double>* %90, align 8
  %94 = load <2 x double>, <2 x double>* %92, align 8
  %95 = fmul <2 x double> %93, %94
  %96 = extractelement <2 x double> %95, i32 0
  %97 = extractelement <2 x double> %95, i32 1
  %98 = fsub double %.219, %96
  %99 = fsub double %98, %97
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv77, i64 %indvars.iv.next.1
  %101 = bitcast double* %100 to <2 x double>*
  %102 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next.1
  %103 = bitcast double* %102 to <2 x double>*
  %104 = load <2 x double>, <2 x double>* %101, align 8
  %105 = load <2 x double>, <2 x double>* %103, align 8
  %106 = fmul <2 x double> %104, %105
  %107 = extractelement <2 x double> %106, i32 0
  %108 = extractelement <2 x double> %106, i32 1
  %109 = fsub double %99, %107
  %110 = fsub double %109, %108
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.374 = icmp eq i64 %indvars.iv.next.3, %indvars.iv77
  br i1 %exitcond.374, label %._crit_edge22.loopexit, label %.lr.ph21.new

._crit_edge22.loopexit:                           ; preds = %.lr.ph21.new
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge22.loopexit, %.prol.loopexit69, %.lr.ph26
  %.2.lcssa = phi double [ %78, %.lr.ph26 ], [ %.lcssa59.unr, %.prol.loopexit69 ], [ %110, %._crit_edge22.loopexit ]
  %111 = getelementptr inbounds double, double* %3, i64 %indvars.iv77
  store double %.2.lcssa, double* %111, align 8
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond138 = icmp eq i64 %indvars.iv.next78, 2000
  br i1 %exitcond138, label %._crit_edge22..lr.ph16_crit_edge, label %._crit_edge22..lr.ph26_crit_edge

._crit_edge22..lr.ph26_crit_edge:                 ; preds = %._crit_edge22
  %indvars.iv.next137 = add i2 %indvars.iv136, 1
  br label %.lr.ph26

._crit_edge22..lr.ph16_crit_edge:                 ; preds = %._crit_edge22
  %112 = ptrtoint double* %2 to i64
  br label %.lr.ph16

.lr.ph16:                                         ; preds = %._crit_edge..lr.ph16_crit_edge, %._crit_edge22..lr.ph16_crit_edge
  %indvars.iv134 = phi i2 [ %indvars.iv.next135, %._crit_edge..lr.ph16_crit_edge ], [ 0, %._crit_edge22..lr.ph16_crit_edge ]
  %indvars.iv132 = phi i64 [ %indvars.iv.next133, %._crit_edge..lr.ph16_crit_edge ], [ 2001, %._crit_edge22..lr.ph16_crit_edge ]
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %._crit_edge..lr.ph16_crit_edge ], [ 2000, %._crit_edge22..lr.ph16_crit_edge ]
  %indvar = phi i32 [ %indvar.next, %._crit_edge..lr.ph16_crit_edge ], [ 0, %._crit_edge22..lr.ph16_crit_edge ]
  %.2914.in = phi i32 [ %.2914, %._crit_edge..lr.ph16_crit_edge ], [ 2000, %._crit_edge22..lr.ph16_crit_edge ]
  %113 = zext i2 %indvars.iv134 to i64
  %114 = add nuw nsw i64 %113, 4294967295
  %115 = and i64 %114, 4294967295
  %116 = add i64 %indvars.iv132, %115
  %117 = add nsw i32 %indvar, -1
  %indvars.iv.next65 = add nsw i64 %indvars.iv64, -1
  %.2914 = add nsw i32 %.2914.in, -1
  %118 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next65
  %119 = load double, double* %118, align 8
  %120 = icmp slt i32 %.2914.in, 2000
  br i1 %120, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph16
  %xtraiter = and i32 %indvar, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.lr.ph..prol.preheader_crit_edge

.lr.ph..prol.preheader_crit_edge:                 ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader..prol.preheader_crit_edge, %.lr.ph..prol.preheader_crit_edge
  %indvars.iv62.prol = phi i64 [ %indvars.iv.next63.prol, %.prol.preheader..prol.preheader_crit_edge ], [ %indvars.iv64, %.lr.ph..prol.preheader_crit_edge ]
  %.311.prol = phi double [ %126, %.prol.preheader..prol.preheader_crit_edge ], [ %119, %.lr.ph..prol.preheader_crit_edge ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.lr.ph..prol.preheader_crit_edge ]
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next65, i64 %indvars.iv62.prol
  %122 = load double, double* %121, align 8
  %123 = getelementptr inbounds double, double* %2, i64 %indvars.iv62.prol
  %124 = load double, double* %123, align 8
  %125 = fmul double %122, %124
  %126 = fsub double %.311.prol, %125
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !4

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  %indvars.iv.next63.prol = add nsw i64 %indvars.iv62.prol, 1
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv62.unr = phi i64 [ %indvars.iv64, %.lr.ph ], [ %116, %.prol.loopexit.loopexit ]
  %.311.unr = phi double [ %119, %.lr.ph ], [ %126, %.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %126, %.prol.loopexit.loopexit ]
  %127 = icmp ult i32 %117, 3
  br i1 %127, label %._crit_edge, label %.prol.loopexit..lr.ph.new_crit_edge

.prol.loopexit..lr.ph.new_crit_edge:              ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new, %.prol.loopexit..lr.ph.new_crit_edge
  %indvars.iv62 = phi i64 [ %indvars.iv62.unr, %.prol.loopexit..lr.ph.new_crit_edge ], [ %indvars.iv.next63.3, %.lr.ph.new ]
  %.311 = phi double [ %.311.unr, %.prol.loopexit..lr.ph.new_crit_edge ], [ %149, %.lr.ph.new ]
  %128 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next65, i64 %indvars.iv62
  %129 = bitcast double* %128 to <2 x double>*
  %130 = getelementptr inbounds double, double* %2, i64 %indvars.iv62
  %131 = bitcast double* %130 to <2 x double>*
  %132 = load <2 x double>, <2 x double>* %129, align 8
  %133 = load <2 x double>, <2 x double>* %131, align 8
  %134 = fmul <2 x double> %132, %133
  %135 = extractelement <2 x double> %134, i32 0
  %136 = extractelement <2 x double> %134, i32 1
  %137 = fsub double %.311, %135
  %138 = fsub double %137, %136
  %indvars.iv.next63.1 = add nsw i64 %indvars.iv62, 2
  %139 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next65, i64 %indvars.iv.next63.1
  %140 = bitcast double* %139 to <2 x double>*
  %141 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next63.1
  %142 = bitcast double* %141 to <2 x double>*
  %143 = load <2 x double>, <2 x double>* %140, align 8
  %144 = load <2 x double>, <2 x double>* %142, align 8
  %145 = fmul <2 x double> %143, %144
  %146 = extractelement <2 x double> %145, i32 0
  %147 = extractelement <2 x double> %145, i32 1
  %148 = fsub double %138, %146
  %149 = fsub double %148, %147
  %indvars.iv.next63.3 = add nsw i64 %indvars.iv62, 4
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next63.3 to i32
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, 2000
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.lr.ph16
  %.3.lcssa = phi double [ %119, %.lr.ph16 ], [ %.lcssa.unr, %.prol.loopexit ], [ %149, %._crit_edge.loopexit ]
  %150 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next65, i64 %indvars.iv.next65
  %151 = load double, double* %150, align 8
  %152 = fdiv double %.3.lcssa, %151
  %sunkaddr122 = shl i64 %indvars.iv64, 3
  %sunkaddr123 = add i64 %112, %sunkaddr122
  %sunkaddr124 = add i64 %sunkaddr123, -8
  %sunkaddr125 = inttoptr i64 %sunkaddr124 to double*
  store double %152, double* %sunkaddr125, align 8
  %153 = icmp sgt i64 %indvars.iv64, 1
  br i1 %153, label %._crit_edge..lr.ph16_crit_edge, label %._crit_edge17

._crit_edge..lr.ph16_crit_edge:                   ; preds = %._crit_edge
  %indvars.iv.next135 = add i2 %indvars.iv134, 1
  %indvars.iv.next133 = add nsw i64 %indvars.iv132, -1
  %indvar.next = add nuw nsw i32 %indvar, 1
  br label %.lr.ph16

._crit_edge17:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
.lr.ph.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph

.lr.ph:                                           ; preds = %10, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %10 ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = srem i32 %5, 20
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %10

; <label>:8:                                      ; preds = %.lr.ph
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %9) #6
  br label %10

; <label>:10:                                     ; preds = %.lr.ph, %8
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond2, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %10
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %17) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
