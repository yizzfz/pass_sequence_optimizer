; ModuleID = 'B.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 2000, double* %9)
  br label %16

; <label>:16:                                     ; preds = %15, %12, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  %6 = sitofp i32 %0 to double
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph47.preheader, label %._crit_edge44.thread

.lr.ph47.preheader:                               ; preds = %5
  %xtraiter104 = and i32 %0, 1
  %lcmp.mod105 = icmp eq i32 %xtraiter104, 0
  br i1 %lcmp.mod105, label %.lr.ph47.prol.loopexit, label %.lr.ph47.prol

.lr.ph47.prol:                                    ; preds = %.lr.ph47.preheader
  store double 0.000000e+00, double* %3, align 8
  store double 0.000000e+00, double* %4, align 8
  %8 = fdiv double 1.000000e+00, %6
  %9 = fmul double %8, 5.000000e-01
  %10 = fadd double %9, 4.000000e+00
  store double %10, double* %2, align 8
  br label %.lr.ph47.prol.loopexit

.lr.ph47.prol.loopexit:                           ; preds = %.lr.ph47.prol, %.lr.ph47.preheader
  %indvars.iv100.unr = phi i64 [ 0, %.lr.ph47.preheader ], [ 1, %.lr.ph47.prol ]
  %11 = icmp eq i32 %0, 1
  br i1 %11, label %.preheader15.preheader, label %.lr.ph47.preheader111

.lr.ph47.preheader111:                            ; preds = %.lr.ph47.prol.loopexit
  %wide.trip.count102.1 = zext i32 %0 to i64
  br label %.lr.ph47

.preheader16:                                     ; preds = %.lr.ph47
  %12 = icmp sgt i32 %0, 0
  br i1 %12, label %.preheader15.preheader, label %._crit_edge44.thread

.preheader15.preheader:                           ; preds = %.preheader16, %.lr.ph47.prol.loopexit
  %13 = add i32 %0, -2
  %14 = zext i32 %13 to i64
  %15 = sext i32 %0 to i64
  %wide.trip.count98 = zext i32 %0 to i64
  br label %.lr.ph38

.lr.ph47:                                         ; preds = %.lr.ph47, %.lr.ph47.preheader111
  %indvars.iv100 = phi i64 [ %indvars.iv.next101.1, %.lr.ph47 ], [ %indvars.iv100.unr, %.lr.ph47.preheader111 ]
  %16 = getelementptr inbounds double, double* %3, i64 %indvars.iv100
  store double 0.000000e+00, double* %16, align 8
  %17 = getelementptr inbounds double, double* %4, i64 %indvars.iv100
  store double 0.000000e+00, double* %17, align 8
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %18 = trunc i64 %indvars.iv.next101 to i32
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %6
  %21 = fmul double %20, 5.000000e-01
  %22 = fadd double %21, 4.000000e+00
  %23 = getelementptr inbounds double, double* %2, i64 %indvars.iv100
  store double %22, double* %23, align 8
  %24 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next101
  store double 0.000000e+00, double* %24, align 8
  %25 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next101
  store double 0.000000e+00, double* %25, align 8
  %indvars.iv.next101.1 = add nsw i64 %indvars.iv100, 2
  %26 = trunc i64 %indvars.iv.next101.1 to i32
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, %6
  %29 = fmul double %28, 5.000000e-01
  %30 = fadd double %29, 4.000000e+00
  %31 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next101
  store double %30, double* %31, align 8
  %exitcond103.1 = icmp eq i64 %indvars.iv.next101.1, %wide.trip.count102.1
  br i1 %exitcond103.1, label %.preheader16, label %.lr.ph47

.lr.ph38:                                         ; preds = %._crit_edge42, %.preheader15.preheader
  %indvars.iv96 = phi i64 [ 0, %.preheader15.preheader ], [ %indvars.iv.next97, %._crit_edge42 ]
  %indvars.iv94 = phi i64 [ 1, %.preheader15.preheader ], [ %indvars.iv.next95, %._crit_edge42 ]
  %32 = mul nuw nsw i64 %indvars.iv96, 2001
  %33 = add nuw nsw i64 %32, 1
  %scevgep92 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %33
  %scevgep9293 = bitcast double* %scevgep92 to i8*
  %34 = sub i64 %14, %indvars.iv96
  %35 = shl i64 %34, 3
  %36 = and i64 %35, 34359738360
  %37 = add nuw nsw i64 %36, 8
  br label %39

.preheader14:                                     ; preds = %39
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  %38 = icmp slt i64 %indvars.iv.next97, %15
  br i1 %38, label %._crit_edge42.loopexit, label %._crit_edge42

; <label>:39:                                     ; preds = %39, %.lr.ph38
  %indvars.iv80 = phi i64 [ %indvars.iv.next81, %39 ], [ 0, %.lr.ph38 ]
  %40 = sub nsw i64 0, %indvars.iv80
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, %0
  %43 = sitofp i32 %42 to double
  %44 = fdiv double %43, %6
  %45 = fadd double %44, 1.000000e+00
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv96, i64 %indvars.iv80
  store double %45, double* %46, align 8
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next81, %indvars.iv94
  br i1 %exitcond85, label %.preheader14, label %39

._crit_edge42.loopexit:                           ; preds = %.preheader14
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep9293, i8 0, i64 %37, i32 8, i1 false)
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit, %.preheader14
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv96, i64 %indvars.iv96
  store double 1.000000e+00, double* %47, align 8
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94, 1
  %exitcond99 = icmp eq i64 %indvars.iv.next97, %wide.trip.count98
  br i1 %exitcond99, label %._crit_edge44, label %.lr.ph38

._crit_edge44.thread:                             ; preds = %.preheader16, %5
  %48 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge19

._crit_edge44:                                    ; preds = %._crit_edge42
  %49 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %50 = bitcast i8* %49 to [2000 x [2000 x double]]*
  %51 = icmp sgt i32 %0, 0
  br i1 %51, label %.preheader13.us.preheader, label %._crit_edge19

.preheader13.us.preheader:                        ; preds = %._crit_edge44
  %52 = add i32 %0, -1
  %53 = zext i32 %52 to i64
  %54 = shl nuw nsw i64 %53, 3
  %55 = add nuw nsw i64 %54, 8
  %xtraiter77 = and i32 %0, 3
  %lcmp.mod78 = icmp eq i32 %xtraiter77, 0
  br i1 %lcmp.mod78, label %.preheader13.us.prol.loopexit, label %._crit_edge35.us.prol.preheader

._crit_edge35.us.prol.preheader:                  ; preds = %.preheader13.us.preheader
  br label %._crit_edge35.us.prol

._crit_edge35.us.prol:                            ; preds = %._crit_edge35.us.prol, %._crit_edge35.us.prol.preheader
  %indvars.iv73.prol = phi i64 [ %indvars.iv.next74.prol, %._crit_edge35.us.prol ], [ 0, %._crit_edge35.us.prol.preheader ]
  %prol.iter79 = phi i32 [ %prol.iter79.sub, %._crit_edge35.us.prol ], [ %xtraiter77, %._crit_edge35.us.prol.preheader ]
  %56 = mul nuw nsw i64 %indvars.iv73.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %49, i64 %56
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %55, i32 8, i1 false)
  %indvars.iv.next74.prol = add nuw nsw i64 %indvars.iv73.prol, 1
  %prol.iter79.sub = add i32 %prol.iter79, -1
  %prol.iter79.cmp = icmp eq i32 %prol.iter79.sub, 0
  br i1 %prol.iter79.cmp, label %.preheader13.us.prol.loopexit.loopexit, label %._crit_edge35.us.prol, !llvm.loop !1

.preheader13.us.prol.loopexit.loopexit:           ; preds = %._crit_edge35.us.prol
  br label %.preheader13.us.prol.loopexit

.preheader13.us.prol.loopexit:                    ; preds = %.preheader13.us.prol.loopexit.loopexit, %.preheader13.us.preheader
  %indvars.iv73.unr = phi i64 [ 0, %.preheader13.us.preheader ], [ %indvars.iv.next74.prol, %.preheader13.us.prol.loopexit.loopexit ]
  %57 = icmp ult i32 %52, 3
  br i1 %57, label %.preheader11.lr.ph, label %._crit_edge35.us.3.preheader

._crit_edge35.us.3.preheader:                     ; preds = %.preheader13.us.prol.loopexit
  %wide.trip.count75.3 = zext i32 %0 to i64
  %58 = add nsw i64 %wide.trip.count75.3, -4
  %59 = sub i64 %58, %indvars.iv73.unr
  %60 = lshr i64 %59, 2
  %61 = and i64 %60, 1
  %lcmp.mod113 = icmp eq i64 %61, 0
  br i1 %lcmp.mod113, label %._crit_edge35.us.3.prol.preheader, label %._crit_edge35.us.3.prol.loopexit

._crit_edge35.us.3.prol.preheader:                ; preds = %._crit_edge35.us.3.preheader
  br label %._crit_edge35.us.3.prol

._crit_edge35.us.3.prol:                          ; preds = %._crit_edge35.us.3.prol.preheader
  %62 = mul nuw nsw i64 %indvars.iv73.unr, 16000
  %scevgep.prol115 = getelementptr i8, i8* %49, i64 %62
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol115, i8 0, i64 %55, i32 8, i1 false)
  %63 = mul i64 %indvars.iv73.unr, 16000
  %64 = add i64 %63, 16000
  %scevgep.1.prol = getelementptr i8, i8* %49, i64 %64
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %55, i32 8, i1 false)
  %65 = mul i64 %indvars.iv73.unr, 16000
  %66 = add i64 %65, 32000
  %scevgep.2.prol = getelementptr i8, i8* %49, i64 %66
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %55, i32 8, i1 false)
  %67 = mul i64 %indvars.iv73.unr, 16000
  %68 = add i64 %67, 48000
  %scevgep.3.prol = getelementptr i8, i8* %49, i64 %68
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %55, i32 8, i1 false)
  %indvars.iv.next74.3.prol = add nsw i64 %indvars.iv73.unr, 4
  br label %._crit_edge35.us.3.prol.loopexit

._crit_edge35.us.3.prol.loopexit:                 ; preds = %._crit_edge35.us.3.prol, %._crit_edge35.us.3.preheader
  %indvars.iv73.unr116 = phi i64 [ %indvars.iv73.unr, %._crit_edge35.us.3.preheader ], [ %indvars.iv.next74.3.prol, %._crit_edge35.us.3.prol ]
  %69 = icmp eq i64 %60, 0
  br i1 %69, label %.preheader12, label %._crit_edge35.us.3.preheader.new

._crit_edge35.us.3.preheader.new:                 ; preds = %._crit_edge35.us.3.prol.loopexit
  br label %._crit_edge35.us.3

.preheader12.unr-lcssa:                           ; preds = %._crit_edge35.us.3
  br label %.preheader12

.preheader12:                                     ; preds = %.preheader12.unr-lcssa, %._crit_edge35.us.3.prol.loopexit
  %70 = icmp sgt i32 %0, 0
  br i1 %70, label %.preheader11.lr.ph, label %._crit_edge19

.preheader11.lr.ph:                               ; preds = %.preheader12, %.preheader13.us.prol.loopexit
  %xtraiter59 = and i32 %0, 1
  %lcmp.mod60 = icmp eq i32 %xtraiter59, 0
  %71 = icmp eq i32 %0, 1
  %wide.trip.count63 = zext i32 %0 to i64
  %wide.trip.count55.1 = zext i32 %0 to i64
  %wide.trip.count67 = zext i32 %0 to i64
  br label %.preheader10.us.us.preheader

.preheader10.us.us.preheader:                     ; preds = %._crit_edge24.us, %.preheader11.lr.ph
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge24.us ], [ 0, %.preheader11.lr.ph ]
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv65
  br label %.preheader10.us.us

._crit_edge24.us:                                 ; preds = %._crit_edge22.us.us
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next66, %wide.trip.count67
  br i1 %exitcond68, label %.preheader9, label %.preheader10.us.us.preheader

.preheader10.us.us:                               ; preds = %._crit_edge22.us.us, %.preheader10.us.us.preheader
  %indvars.iv61 = phi i64 [ 0, %.preheader10.us.us.preheader ], [ %indvars.iv.next62, %._crit_edge22.us.us ]
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv61, i64 %indvars.iv65
  br i1 %lcmp.mod60, label %.prol.loopexit58, label %.prol.preheader57

.prol.preheader57:                                ; preds = %.preheader10.us.us
  %74 = load double, double* %73, align 8
  %75 = load double, double* %72, align 8
  %76 = fmul double %74, %75
  %77 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv61, i64 0
  %78 = load double, double* %77, align 8
  %79 = fadd double %78, %76
  store double %79, double* %77, align 8
  br label %.prol.loopexit58

.prol.loopexit58:                                 ; preds = %.prol.preheader57, %.preheader10.us.us
  %indvars.iv53.unr.ph = phi i64 [ 1, %.prol.preheader57 ], [ 0, %.preheader10.us.us ]
  br i1 %71, label %._crit_edge22.us.us, label %.preheader10.us.us.new.preheader

.preheader10.us.us.new.preheader:                 ; preds = %.prol.loopexit58
  br label %.preheader10.us.us.new

._crit_edge22.us.us.loopexit:                     ; preds = %.preheader10.us.us.new
  br label %._crit_edge22.us.us

._crit_edge22.us.us:                              ; preds = %._crit_edge22.us.us.loopexit, %.prol.loopexit58
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, %wide.trip.count63
  br i1 %exitcond64, label %._crit_edge24.us, label %.preheader10.us.us

.preheader10.us.us.new:                           ; preds = %.preheader10.us.us.new, %.preheader10.us.us.new.preheader
  %indvars.iv53 = phi i64 [ %indvars.iv.next54.1, %.preheader10.us.us.new ], [ %indvars.iv53.unr.ph, %.preheader10.us.us.new.preheader ]
  %80 = load double, double* %73, align 8
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv53, i64 %indvars.iv65
  %82 = load double, double* %81, align 8
  %83 = fmul double %80, %82
  %84 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv61, i64 %indvars.iv53
  %85 = load double, double* %84, align 8
  %86 = fadd double %85, %83
  store double %86, double* %84, align 8
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %87 = load double, double* %73, align 8
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next54, i64 %indvars.iv65
  %89 = load double, double* %88, align 8
  %90 = fmul double %87, %89
  %91 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv61, i64 %indvars.iv.next54
  %92 = load double, double* %91, align 8
  %93 = fadd double %92, %90
  store double %93, double* %91, align 8
  %indvars.iv.next54.1 = add nsw i64 %indvars.iv53, 2
  %exitcond56.1 = icmp eq i64 %indvars.iv.next54.1, %wide.trip.count55.1
  br i1 %exitcond56.1, label %._crit_edge22.us.us.loopexit, label %.preheader10.us.us.new

.preheader9:                                      ; preds = %._crit_edge24.us
  %94 = icmp sgt i32 %0, 0
  br i1 %94, label %.preheader.us.preheader, label %._crit_edge19

.preheader.us.preheader:                          ; preds = %.preheader9
  %95 = add i32 %0, -1
  %xtraiter = and i32 %0, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %96 = icmp ult i32 %95, 3
  %wide.trip.count52 = zext i32 %0 to i64
  %wide.trip.count.3 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv50 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next51, %._crit_edge.us ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader, %.prol.preheader.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %97 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv50, i64 %indvars.iv.prol
  %98 = bitcast double* %97 to i64*
  %99 = load i64, i64* %98, align 8
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 %indvars.iv.prol
  %101 = bitcast double* %100 to i64*
  store i64 %99, i64* %101, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  br i1 %96, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new, %.preheader.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new ], [ %indvars.iv.unr, %.preheader.us.new.preheader ]
  %102 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv50, i64 %indvars.iv
  %103 = bitcast double* %102 to i64*
  %104 = load i64, i64* %103, align 8
  %105 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 %indvars.iv
  %106 = bitcast double* %105 to i64*
  store i64 %104, i64* %106, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %107 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv50, i64 %indvars.iv.next
  %108 = bitcast double* %107 to i64*
  %109 = load i64, i64* %108, align 8
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 %indvars.iv.next
  %111 = bitcast double* %110 to i64*
  store i64 %109, i64* %111, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %112 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv50, i64 %indvars.iv.next.1
  %113 = bitcast double* %112 to i64*
  %114 = load i64, i64* %113, align 8
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 %indvars.iv.next.1
  %116 = bitcast double* %115 to i64*
  store i64 %114, i64* %116, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %117 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv50, i64 %indvars.iv.next.2
  %118 = bitcast double* %117 to i64*
  %119 = load i64, i64* %118, align 8
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 %indvars.iv.next.2
  %121 = bitcast double* %120 to i64*
  store i64 %119, i64* %121, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond = icmp eq i64 %indvars.iv.next51, %wide.trip.count52
  br i1 %exitcond, label %._crit_edge19.loopexit, label %.preheader.us

._crit_edge19.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit, %.preheader9, %.preheader12, %._crit_edge44, %._crit_edge44.thread
  %122 = phi i8* [ %49, %.preheader9 ], [ %49, %.preheader12 ], [ %49, %._crit_edge44 ], [ %48, %._crit_edge44.thread ], [ %49, %._crit_edge19.loopexit ]
  tail call void @free(i8* %122) #4
  ret void

._crit_edge35.us.3:                               ; preds = %._crit_edge35.us.3, %._crit_edge35.us.3.preheader.new
  %indvars.iv73 = phi i64 [ %indvars.iv73.unr116, %._crit_edge35.us.3.preheader.new ], [ %indvars.iv.next74.3.1, %._crit_edge35.us.3 ]
  %123 = mul nuw nsw i64 %indvars.iv73, 16000
  %scevgep = getelementptr i8, i8* %49, i64 %123
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %55, i32 8, i1 false)
  %124 = mul i64 %indvars.iv73, 16000
  %125 = add i64 %124, 16000
  %scevgep.1 = getelementptr i8, i8* %49, i64 %125
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %55, i32 8, i1 false)
  %126 = mul i64 %indvars.iv73, 16000
  %127 = add i64 %126, 32000
  %scevgep.2 = getelementptr i8, i8* %49, i64 %127
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %55, i32 8, i1 false)
  %128 = mul i64 %indvars.iv73, 16000
  %129 = add i64 %128, 48000
  %scevgep.3 = getelementptr i8, i8* %49, i64 %129
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %55, i32 8, i1 false)
  %indvars.iv.next74.3 = add nsw i64 %indvars.iv73, 4
  %130 = mul nuw nsw i64 %indvars.iv.next74.3, 16000
  %scevgep.1117 = getelementptr i8, i8* %49, i64 %130
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1117, i8 0, i64 %55, i32 8, i1 false)
  %131 = mul i64 %indvars.iv.next74.3, 16000
  %132 = add i64 %131, 16000
  %scevgep.1.1 = getelementptr i8, i8* %49, i64 %132
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %55, i32 8, i1 false)
  %133 = mul i64 %indvars.iv.next74.3, 16000
  %134 = add i64 %133, 32000
  %scevgep.2.1 = getelementptr i8, i8* %49, i64 %134
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %55, i32 8, i1 false)
  %135 = mul i64 %indvars.iv.next74.3, 16000
  %136 = add i64 %135, 48000
  %scevgep.3.1 = getelementptr i8, i8* %49, i64 %136
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %55, i32 8, i1 false)
  %indvars.iv.next74.3.1 = add nsw i64 %indvars.iv73, 8
  %exitcond76.3.1 = icmp eq i64 %indvars.iv.next74.3.1, %wide.trip.count75.3
  br i1 %exitcond76.3.1, label %.preheader12.unr-lcssa, label %._crit_edge35.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader12.preheader, label %._crit_edge19

.preheader12.preheader:                           ; preds = %5
  %wide.trip.count101 = zext i32 %0 to i64
  %wide.trip.count95 = zext i32 %0 to i64
  br label %.preheader12

.preheader12:                                     ; preds = %._crit_edge44, %.preheader12.preheader
  %indvars.iv99 = phi i64 [ %indvars.iv.next100, %._crit_edge44 ], [ 0, %.preheader12.preheader ]
  %7 = add i64 %indvars.iv99, 4294967295
  %8 = icmp sgt i64 %indvars.iv99, 0
  br i1 %8, label %.lr.ph35.preheader, label %._crit_edge44

.lr.ph35.preheader:                               ; preds = %.preheader12
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99, i64 0
  br label %.lr.ph35

.preheader10:                                     ; preds = %._crit_edge44
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.lr.ph27.preheader, label %._crit_edge19

.lr.ph27.preheader:                               ; preds = %.preheader10
  %wide.trip.count67 = zext i32 %0 to i64
  br label %.lr.ph27

.lr.ph43:                                         ; preds = %._crit_edge32
  %11 = icmp sgt i64 %indvars.iv99, 0
  br i1 %11, label %.lr.ph43.split.us.preheader, label %._crit_edge44

.lr.ph43.split.us.preheader:                      ; preds = %.lr.ph43
  %xtraiter89103 = and i64 %indvars.iv99, 1
  %lcmp.mod90 = icmp eq i64 %xtraiter89103, 0
  %12 = trunc i64 %7 to i32
  %13 = icmp eq i32 %12, 0
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99, i64 0
  br label %.lr.ph43.split.us

.lr.ph43.split.us:                                ; preds = %._crit_edge40.us, %.lr.ph43.split.us.preheader
  %indvars.iv93 = phi i64 [ %indvars.iv.next94, %._crit_edge40.us ], [ %indvars.iv99, %.lr.ph43.split.us.preheader ]
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99, i64 %indvars.iv93
  %16 = load double, double* %15, align 8
  br i1 %lcmp.mod90, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph43.split.us
  %17 = load double, double* %14, align 8
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv93
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fsub double %16, %20
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph43.split.us
  %indvars.iv84.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph43.split.us ]
  %.137.us.unr.ph = phi double [ %21, %.prol.preheader ], [ %16, %.lr.ph43.split.us ]
  %.lcssa51.unr.ph = phi double [ %21, %.prol.preheader ], [ undef, %.lr.ph43.split.us ]
  br i1 %13, label %._crit_edge40.us, label %.lr.ph43.split.us.new.preheader

.lr.ph43.split.us.new.preheader:                  ; preds = %.prol.loopexit
  br label %.lr.ph43.split.us.new

.lr.ph43.split.us.new:                            ; preds = %.lr.ph43.split.us.new, %.lr.ph43.split.us.new.preheader
  %indvars.iv84 = phi i64 [ %indvars.iv.next85.1, %.lr.ph43.split.us.new ], [ %indvars.iv84.unr.ph, %.lr.ph43.split.us.new.preheader ]
  %.137.us = phi double [ %33, %.lr.ph43.split.us.new ], [ %.137.us.unr.ph, %.lr.ph43.split.us.new.preheader ]
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99, i64 %indvars.iv84
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv84, i64 %indvars.iv93
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fsub double %.137.us, %26
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99, i64 %indvars.iv.next85
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next85, i64 %indvars.iv93
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fsub double %27, %32
  %indvars.iv.next85.1 = add nsw i64 %indvars.iv84, 2
  %exitcond88.1 = icmp eq i64 %indvars.iv.next85.1, %indvars.iv99
  br i1 %exitcond88.1, label %._crit_edge40.us.loopexit, label %.lr.ph43.split.us.new

._crit_edge40.us.loopexit:                        ; preds = %.lr.ph43.split.us.new
  br label %._crit_edge40.us

._crit_edge40.us:                                 ; preds = %._crit_edge40.us.loopexit, %.prol.loopexit
  %.lcssa51 = phi double [ %.lcssa51.unr.ph, %.prol.loopexit ], [ %33, %._crit_edge40.us.loopexit ]
  store double %.lcssa51, double* %15, align 8
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next94, %wide.trip.count95
  br i1 %exitcond96, label %._crit_edge44.loopexit, label %.lr.ph43.split.us

.lr.ph35:                                         ; preds = %._crit_edge32, %.lr.ph35.preheader
  %indvars.iv77 = phi i64 [ %indvars.iv.next78, %._crit_edge32 ], [ 0, %.lr.ph35.preheader ]
  %34 = add i64 %indvars.iv77, 4294967295
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99, i64 %indvars.iv77
  %36 = load double, double* %35, align 8
  %37 = icmp sgt i64 %indvars.iv77, 0
  br i1 %37, label %.lr.ph31.preheader, label %._crit_edge32

.lr.ph31.preheader:                               ; preds = %.lr.ph35
  %xtraiter73104 = and i64 %indvars.iv77, 1
  %lcmp.mod74 = icmp eq i64 %xtraiter73104, 0
  br i1 %lcmp.mod74, label %.lr.ph31.prol.loopexit, label %.lr.ph31.prol

.lr.ph31.prol:                                    ; preds = %.lr.ph31.preheader
  %38 = load double, double* %9, align 8
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv77
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fsub double %36, %41
  br label %.lr.ph31.prol.loopexit

.lr.ph31.prol.loopexit:                           ; preds = %.lr.ph31.prol, %.lr.ph31.preheader
  %indvars.iv68.unr.ph = phi i64 [ 1, %.lr.ph31.prol ], [ 0, %.lr.ph31.preheader ]
  %.029.unr.ph = phi double [ %42, %.lr.ph31.prol ], [ %36, %.lr.ph31.preheader ]
  %.lcssa50.unr.ph = phi double [ %42, %.lr.ph31.prol ], [ undef, %.lr.ph31.preheader ]
  %43 = trunc i64 %34 to i32
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %._crit_edge32, label %.lr.ph31.preheader123

.lr.ph31.preheader123:                            ; preds = %.lr.ph31.prol.loopexit
  br label %.lr.ph31

.lr.ph31:                                         ; preds = %.lr.ph31, %.lr.ph31.preheader123
  %indvars.iv68 = phi i64 [ %indvars.iv.next69.1, %.lr.ph31 ], [ %indvars.iv68.unr.ph, %.lr.ph31.preheader123 ]
  %.029 = phi double [ %56, %.lr.ph31 ], [ %.029.unr.ph, %.lr.ph31.preheader123 ]
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99, i64 %indvars.iv68
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv68, i64 %indvars.iv77
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fsub double %.029, %49
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99, i64 %indvars.iv.next69
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next69, i64 %indvars.iv77
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = fsub double %50, %55
  %indvars.iv.next69.1 = add nsw i64 %indvars.iv68, 2
  %exitcond72.1 = icmp eq i64 %indvars.iv.next69.1, %indvars.iv77
  br i1 %exitcond72.1, label %._crit_edge32.loopexit, label %.lr.ph31

._crit_edge32.loopexit:                           ; preds = %.lr.ph31
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %._crit_edge32.loopexit, %.lr.ph31.prol.loopexit, %.lr.ph35
  %.0.lcssa = phi double [ %36, %.lr.ph35 ], [ %.lcssa50.unr.ph, %.lr.ph31.prol.loopexit ], [ %56, %._crit_edge32.loopexit ]
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv77, i64 %indvars.iv77
  %58 = load double, double* %57, align 8
  %59 = fdiv double %.0.lcssa, %58
  store double %59, double* %35, align 8
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond82 = icmp eq i64 %indvars.iv.next78, %indvars.iv99
  br i1 %exitcond82, label %.lr.ph43, label %.lr.ph35

._crit_edge44.loopexit:                           ; preds = %._crit_edge40.us
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %._crit_edge44.loopexit, %.lr.ph43, %.preheader12
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %exitcond102 = icmp eq i64 %indvars.iv.next100, %wide.trip.count101
  br i1 %exitcond102, label %.preheader10, label %.preheader12

.preheader:                                       ; preds = %._crit_edge24
  %60 = icmp sgt i32 %0, 0
  br i1 %60, label %.lr.ph18.preheader, label %._crit_edge19

.lr.ph18.preheader:                               ; preds = %.preheader
  %61 = sext i32 %0 to i64
  br label %.lr.ph18

.lr.ph27:                                         ; preds = %._crit_edge24, %.lr.ph27.preheader
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge24 ], [ 0, %.lr.ph27.preheader ]
  %62 = add i64 %indvars.iv65, 4294967295
  %63 = getelementptr inbounds double, double* %2, i64 %indvars.iv65
  %64 = load double, double* %63, align 8
  %65 = icmp sgt i64 %indvars.iv65, 0
  br i1 %65, label %.lr.ph23.preheader, label %._crit_edge24

.lr.ph23.preheader:                               ; preds = %.lr.ph27
  %66 = trunc i64 %indvars.iv65 to i32
  %xtraiter58 = and i32 %66, 3
  %lcmp.mod59 = icmp eq i32 %xtraiter58, 0
  br i1 %lcmp.mod59, label %.lr.ph23.prol.loopexit, label %.lr.ph23.prol.preheader

.lr.ph23.prol.preheader:                          ; preds = %.lr.ph23.preheader
  br label %.lr.ph23.prol

.lr.ph23.prol:                                    ; preds = %.lr.ph23.prol, %.lr.ph23.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph23.prol ], [ 0, %.lr.ph23.prol.preheader ]
  %.221.prol = phi double [ %72, %.lr.ph23.prol ], [ %64, %.lr.ph23.prol.preheader ]
  %prol.iter61 = phi i32 [ %prol.iter61.sub, %.lr.ph23.prol ], [ %xtraiter58, %.lr.ph23.prol.preheader ]
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv.prol
  %68 = load double, double* %67, align 8
  %69 = getelementptr inbounds double, double* %4, i64 %indvars.iv.prol
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = fsub double %.221.prol, %71
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter61.sub = add i32 %prol.iter61, -1
  %prol.iter61.cmp = icmp eq i32 %prol.iter61.sub, 0
  br i1 %prol.iter61.cmp, label %.lr.ph23.prol.loopexit.loopexit, label %.lr.ph23.prol, !llvm.loop !4

.lr.ph23.prol.loopexit.loopexit:                  ; preds = %.lr.ph23.prol
  br label %.lr.ph23.prol.loopexit

.lr.ph23.prol.loopexit:                           ; preds = %.lr.ph23.prol.loopexit.loopexit, %.lr.ph23.preheader
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph23.preheader ], [ %indvars.iv.next.prol, %.lr.ph23.prol.loopexit.loopexit ]
  %.221.unr = phi double [ %64, %.lr.ph23.preheader ], [ %72, %.lr.ph23.prol.loopexit.loopexit ]
  %.lcssa49.unr = phi double [ undef, %.lr.ph23.preheader ], [ %72, %.lr.ph23.prol.loopexit.loopexit ]
  %73 = trunc i64 %62 to i32
  %74 = icmp ult i32 %73, 3
  br i1 %74, label %._crit_edge24, label %.lr.ph23.preheader122

.lr.ph23.preheader122:                            ; preds = %.lr.ph23.prol.loopexit
  br label %.lr.ph23

.lr.ph23:                                         ; preds = %.lr.ph23, %.lr.ph23.preheader122
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph23 ], [ %indvars.iv.unr, %.lr.ph23.preheader122 ]
  %.221 = phi double [ %98, %.lr.ph23 ], [ %.221.unr, %.lr.ph23.preheader122 ]
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds double, double* %4, i64 %indvars.iv
  %78 = load double, double* %77, align 8
  %79 = fmul double %76, %78
  %80 = fsub double %.221, %79
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv.next
  %82 = load double, double* %81, align 8
  %83 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next
  %84 = load double, double* %83, align 8
  %85 = fmul double %82, %84
  %86 = fsub double %80, %85
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv.next.1
  %88 = load double, double* %87, align 8
  %89 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next.1
  %90 = load double, double* %89, align 8
  %91 = fmul double %88, %90
  %92 = fsub double %86, %91
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv.next.2
  %94 = load double, double* %93, align 8
  %95 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next.2
  %96 = load double, double* %95, align 8
  %97 = fmul double %94, %96
  %98 = fsub double %92, %97
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.362 = icmp eq i64 %indvars.iv.next.3, %indvars.iv65
  br i1 %exitcond.362, label %._crit_edge24.loopexit, label %.lr.ph23

._crit_edge24.loopexit:                           ; preds = %.lr.ph23
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit, %.lr.ph23.prol.loopexit, %.lr.ph27
  %.2.lcssa = phi double [ %64, %.lr.ph27 ], [ %.lcssa49.unr, %.lr.ph23.prol.loopexit ], [ %98, %._crit_edge24.loopexit ]
  %99 = getelementptr inbounds double, double* %4, i64 %indvars.iv65
  store double %.2.lcssa, double* %99, align 8
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond = icmp eq i64 %indvars.iv.next66, %wide.trip.count67
  br i1 %exitcond, label %.preheader, label %.lr.ph27

.lr.ph18:                                         ; preds = %._crit_edge, %.lr.ph18.preheader
  %indvars.iv54 = phi i64 [ %61, %.lr.ph18.preheader ], [ %indvars.iv.next55, %._crit_edge ]
  %indvar = phi i32 [ 0, %.lr.ph18.preheader ], [ %indvar.next, %._crit_edge ]
  %.2917.in = phi i32 [ %0, %.lr.ph18.preheader ], [ %.2917, %._crit_edge ]
  %100 = add nsw i32 %indvar, -1
  %indvars.iv.next55 = add nsw i64 %indvars.iv54, -1
  %.2917 = add nsw i32 %.2917.in, -1
  %101 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next55
  %102 = load double, double* %101, align 8
  %103 = icmp slt i32 %.2917.in, %0
  br i1 %103, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.lr.ph18
  %xtraiter = and i32 %indvar, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv52.prol = phi i64 [ %indvars.iv.next53.prol, %.lr.ph.prol ], [ %indvars.iv54, %.lr.ph.prol.preheader ]
  %.314.prol = phi double [ %109, %.lr.ph.prol ], [ %102, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %104 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next55, i64 %indvars.iv52.prol
  %105 = load double, double* %104, align 8
  %106 = getelementptr inbounds double, double* %3, i64 %indvars.iv52.prol
  %107 = load double, double* %106, align 8
  %108 = fmul double %105, %107
  %109 = fsub double %.314.prol, %108
  %indvars.iv.next53.prol = add nsw i64 %indvars.iv52.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !5

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %indvars.iv52.unr = phi i64 [ %indvars.iv54, %.lr.ph.preheader ], [ %indvars.iv.next53.prol, %.lr.ph.prol.loopexit.loopexit ]
  %.314.unr = phi double [ %102, %.lr.ph.preheader ], [ %109, %.lr.ph.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph.preheader ], [ %109, %.lr.ph.prol.loopexit.loopexit ]
  %110 = icmp ult i32 %100, 3
  br i1 %110, label %._crit_edge, label %.lr.ph.preheader121

.lr.ph.preheader121:                              ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader121
  %indvars.iv52 = phi i64 [ %indvars.iv.next53.3, %.lr.ph ], [ %indvars.iv52.unr, %.lr.ph.preheader121 ]
  %.314 = phi double [ %134, %.lr.ph ], [ %.314.unr, %.lr.ph.preheader121 ]
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next55, i64 %indvars.iv52
  %112 = load double, double* %111, align 8
  %113 = getelementptr inbounds double, double* %3, i64 %indvars.iv52
  %114 = load double, double* %113, align 8
  %115 = fmul double %112, %114
  %116 = fsub double %.314, %115
  %indvars.iv.next53 = add nsw i64 %indvars.iv52, 1
  %117 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next55, i64 %indvars.iv.next53
  %118 = load double, double* %117, align 8
  %119 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next53
  %120 = load double, double* %119, align 8
  %121 = fmul double %118, %120
  %122 = fsub double %116, %121
  %indvars.iv.next53.1 = add nsw i64 %indvars.iv52, 2
  %123 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next55, i64 %indvars.iv.next53.1
  %124 = load double, double* %123, align 8
  %125 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next53.1
  %126 = load double, double* %125, align 8
  %127 = fmul double %124, %126
  %128 = fsub double %122, %127
  %indvars.iv.next53.2 = add nsw i64 %indvars.iv52, 3
  %129 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next55, i64 %indvars.iv.next53.2
  %130 = load double, double* %129, align 8
  %131 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next53.2
  %132 = load double, double* %131, align 8
  %133 = fmul double %130, %132
  %134 = fsub double %128, %133
  %indvars.iv.next53.3 = add nsw i64 %indvars.iv52, 4
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next53.3 to i32
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, %0
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.lr.ph18
  %.3.lcssa = phi double [ %102, %.lr.ph18 ], [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %134, %._crit_edge.loopexit ]
  %135 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next55, i64 %indvars.iv.next55
  %136 = load double, double* %135, align 8
  %137 = fdiv double %.3.lcssa, %136
  %138 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next55
  store double %137, double* %138, align 8
  %139 = icmp sgt i64 %indvars.iv54, 1
  %indvar.next = add nuw nsw i32 %indvar, 1
  br i1 %139, label %.lr.ph18, label %._crit_edge19.loopexit

._crit_edge19.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit, %.preheader, %.preheader10, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %13, %.lr.ph.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %13 ], [ 0, %.lr.ph.preheader ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %.lr.ph
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %13

; <label>:13:                                     ; preds = %11, %.lr.ph
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %13
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
!5 = distinct !{!5, !2}
