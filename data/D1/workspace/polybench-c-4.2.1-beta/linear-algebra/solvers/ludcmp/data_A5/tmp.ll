; ModuleID = 'A.ll'
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

; <label>:16:                                     ; preds = %12, %15, %2
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
  br i1 %7, label %.lr.ph45.preheader, label %._crit_edge42.thread

.lr.ph45.preheader:                               ; preds = %5
  %xtraiter109 = and i32 %0, 1
  %lcmp.mod110 = icmp eq i32 %xtraiter109, 0
  br i1 %lcmp.mod110, label %.lr.ph45.prol.loopexit, label %.lr.ph45.prol

.lr.ph45.prol:                                    ; preds = %.lr.ph45.preheader
  store double 0.000000e+00, double* %3, align 8
  store double 0.000000e+00, double* %4, align 8
  %8 = fdiv double 1.000000e+00, %6
  %9 = fmul double %8, 5.000000e-01
  %10 = fadd double %9, 4.000000e+00
  store double %10, double* %2, align 8
  br label %.lr.ph45.prol.loopexit

.lr.ph45.prol.loopexit:                           ; preds = %.lr.ph45.preheader, %.lr.ph45.prol
  %indvars.iv106.unr = phi i64 [ 0, %.lr.ph45.preheader ], [ 1, %.lr.ph45.prol ]
  %11 = icmp eq i32 %0, 1
  br i1 %11, label %.preheader15.preheader, label %.lr.ph45.preheader118

.lr.ph45.preheader118:                            ; preds = %.lr.ph45.prol.loopexit
  %wide.trip.count108.1 = zext i32 %0 to i64
  %12 = insertelement <2 x double> undef, double %6, i32 0
  %13 = shufflevector <2 x double> %12, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph45

.preheader16:                                     ; preds = %.lr.ph45
  %14 = icmp sgt i32 %0, 0
  br i1 %14, label %.preheader15.preheader, label %._crit_edge42.thread

.preheader15.preheader:                           ; preds = %.lr.ph45.prol.loopexit, %.preheader16
  %15 = add i32 %0, -2
  %16 = zext i32 %15 to i64
  %17 = sext i32 %0 to i64
  %wide.trip.count104 = zext i32 %0 to i64
  br label %.lr.ph38

.lr.ph45:                                         ; preds = %.lr.ph45.preheader118, %.lr.ph45
  %indvars.iv106 = phi i64 [ %indvars.iv.next107.1, %.lr.ph45 ], [ %indvars.iv106.unr, %.lr.ph45.preheader118 ]
  %18 = getelementptr inbounds double, double* %3, i64 %indvars.iv106
  %19 = bitcast double* %18 to <2 x double>*
  %20 = getelementptr inbounds double, double* %4, i64 %indvars.iv106
  %21 = bitcast double* %20 to <2 x double>*
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1
  %22 = trunc i64 %indvars.iv.next107 to i32
  %23 = sitofp i32 %22 to double
  %24 = getelementptr inbounds double, double* %2, i64 %indvars.iv106
  store <2 x double> zeroinitializer, <2 x double>* %19, align 8
  store <2 x double> zeroinitializer, <2 x double>* %21, align 8
  %indvars.iv.next107.1 = add nsw i64 %indvars.iv106, 2
  %25 = trunc i64 %indvars.iv.next107.1 to i32
  %26 = sitofp i32 %25 to double
  %27 = insertelement <2 x double> undef, double %23, i32 0
  %28 = insertelement <2 x double> %27, double %26, i32 1
  %29 = fdiv <2 x double> %28, %13
  %30 = fmul <2 x double> %29, <double 5.000000e-01, double 5.000000e-01>
  %31 = fadd <2 x double> %30, <double 4.000000e+00, double 4.000000e+00>
  %32 = bitcast double* %24 to <2 x double>*
  store <2 x double> %31, <2 x double>* %32, align 8
  %exitcond.1112 = icmp eq i64 %indvars.iv.next107.1, %wide.trip.count108.1
  br i1 %exitcond.1112, label %.preheader16, label %.lr.ph45

.lr.ph38:                                         ; preds = %.preheader15.preheader, %._crit_edge40
  %indvars.iv101 = phi i64 [ 0, %.preheader15.preheader ], [ %indvars.iv.next102, %._crit_edge40 ]
  %indvars.iv99 = phi i64 [ 1, %.preheader15.preheader ], [ %indvars.iv.next100, %._crit_edge40 ]
  %33 = mul nuw nsw i64 %indvars.iv101, 2001
  %34 = add nuw nsw i64 %33, 1
  %scevgep97 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %34
  %scevgep9798 = bitcast double* %scevgep97 to i8*
  %35 = sub i64 %16, %indvars.iv101
  %36 = shl i64 %35, 3
  %37 = and i64 %36, 34359738360
  %38 = add nuw nsw i64 %37, 8
  br label %40

.preheader14:                                     ; preds = %40
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  %39 = icmp slt i64 %indvars.iv.next102, %17
  br i1 %39, label %._crit_edge40.loopexit, label %._crit_edge40

; <label>:40:                                     ; preds = %40, %.lr.ph38
  %indvars.iv83 = phi i64 [ %indvars.iv.next84, %40 ], [ 0, %.lr.ph38 ]
  %41 = sub nsw i64 0, %indvars.iv83
  %42 = trunc i64 %41 to i32
  %43 = srem i32 %42, %0
  %44 = sitofp i32 %43 to double
  %45 = fdiv double %44, %6
  %46 = fadd double %45, 1.000000e+00
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv101, i64 %indvars.iv83
  store double %46, double* %47, align 8
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %exitcond91 = icmp eq i64 %indvars.iv.next84, %indvars.iv99
  br i1 %exitcond91, label %.preheader14, label %40

._crit_edge40.loopexit:                           ; preds = %.preheader14
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep9798, i8 0, i64 %38, i32 8, i1 false)
  br label %._crit_edge40

._crit_edge40:                                    ; preds = %._crit_edge40.loopexit, %.preheader14
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv101, i64 %indvars.iv101
  store double 1.000000e+00, double* %48, align 8
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %exitcond105 = icmp eq i64 %indvars.iv.next102, %wide.trip.count104
  br i1 %exitcond105, label %._crit_edge42, label %.lr.ph38

._crit_edge42.thread:                             ; preds = %.preheader16, %5
  %49 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge19

._crit_edge42:                                    ; preds = %._crit_edge40
  %50 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %51 = bitcast i8* %50 to [2000 x [2000 x double]]*
  %52 = icmp sgt i32 %0, 0
  br i1 %52, label %.preheader13.us.preheader, label %._crit_edge19

.preheader13.us.preheader:                        ; preds = %._crit_edge42
  %53 = add i32 %0, -1
  %54 = zext i32 %53 to i64
  %55 = shl nuw nsw i64 %54, 3
  %56 = add nuw nsw i64 %55, 8
  %xtraiter77 = and i32 %0, 3
  %lcmp.mod78 = icmp eq i32 %xtraiter77, 0
  br i1 %lcmp.mod78, label %.preheader13.us.prol.loopexit, label %._crit_edge35.us.prol.preheader

._crit_edge35.us.prol.preheader:                  ; preds = %.preheader13.us.preheader
  br label %._crit_edge35.us.prol

._crit_edge35.us.prol:                            ; preds = %._crit_edge35.us.prol.preheader, %._crit_edge35.us.prol
  %indvars.iv74.prol = phi i64 [ %indvars.iv.next75.prol, %._crit_edge35.us.prol ], [ 0, %._crit_edge35.us.prol.preheader ]
  %prol.iter80 = phi i32 [ %prol.iter80.sub, %._crit_edge35.us.prol ], [ %xtraiter77, %._crit_edge35.us.prol.preheader ]
  %57 = mul nuw nsw i64 %indvars.iv74.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %50, i64 %57
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %56, i32 8, i1 false)
  %indvars.iv.next75.prol = add nuw nsw i64 %indvars.iv74.prol, 1
  %prol.iter80.sub = add i32 %prol.iter80, -1
  %prol.iter80.cmp = icmp eq i32 %prol.iter80.sub, 0
  br i1 %prol.iter80.cmp, label %.preheader13.us.prol.loopexit.loopexit, label %._crit_edge35.us.prol, !llvm.loop !1

.preheader13.us.prol.loopexit.loopexit:           ; preds = %._crit_edge35.us.prol
  br label %.preheader13.us.prol.loopexit

.preheader13.us.prol.loopexit:                    ; preds = %.preheader13.us.prol.loopexit.loopexit, %.preheader13.us.preheader
  %indvars.iv74.unr = phi i64 [ 0, %.preheader13.us.preheader ], [ %indvars.iv.next75.prol, %.preheader13.us.prol.loopexit.loopexit ]
  %58 = icmp ult i32 %53, 3
  br i1 %58, label %.preheader11.lr.ph, label %._crit_edge35.us.3.preheader

._crit_edge35.us.3.preheader:                     ; preds = %.preheader13.us.prol.loopexit
  %wide.trip.count76.3 = zext i32 %0 to i64
  %59 = add nsw i64 %wide.trip.count76.3, -4
  %60 = sub i64 %59, %indvars.iv74.unr
  %61 = lshr i64 %60, 2
  %62 = and i64 %61, 1
  %lcmp.mod120 = icmp eq i64 %62, 0
  br i1 %lcmp.mod120, label %._crit_edge35.us.3.prol.preheader, label %._crit_edge35.us.3.prol.loopexit

._crit_edge35.us.3.prol.preheader:                ; preds = %._crit_edge35.us.3.preheader
  br label %._crit_edge35.us.3.prol

._crit_edge35.us.3.prol:                          ; preds = %._crit_edge35.us.3.prol.preheader
  %63 = mul nuw nsw i64 %indvars.iv74.unr, 16000
  %scevgep.prol122 = getelementptr i8, i8* %50, i64 %63
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol122, i8 0, i64 %56, i32 8, i1 false)
  %64 = mul i64 %indvars.iv74.unr, 16000
  %65 = add i64 %64, 16000
  %scevgep.1.prol = getelementptr i8, i8* %50, i64 %65
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %56, i32 8, i1 false)
  %66 = mul i64 %indvars.iv74.unr, 16000
  %67 = add i64 %66, 32000
  %scevgep.2.prol = getelementptr i8, i8* %50, i64 %67
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %56, i32 8, i1 false)
  %68 = mul i64 %indvars.iv74.unr, 16000
  %69 = add i64 %68, 48000
  %scevgep.3.prol = getelementptr i8, i8* %50, i64 %69
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %56, i32 8, i1 false)
  %indvars.iv.next75.3.prol = add nsw i64 %indvars.iv74.unr, 4
  br label %._crit_edge35.us.3.prol.loopexit

._crit_edge35.us.3.prol.loopexit:                 ; preds = %._crit_edge35.us.3.prol, %._crit_edge35.us.3.preheader
  %indvars.iv74.unr123 = phi i64 [ %indvars.iv74.unr, %._crit_edge35.us.3.preheader ], [ %indvars.iv.next75.3.prol, %._crit_edge35.us.3.prol ]
  %70 = icmp eq i64 %61, 0
  br i1 %70, label %.preheader12, label %._crit_edge35.us.3.preheader.new

._crit_edge35.us.3.preheader.new:                 ; preds = %._crit_edge35.us.3.prol.loopexit
  br label %._crit_edge35.us.3

.preheader12.unr-lcssa:                           ; preds = %._crit_edge35.us.3
  br label %.preheader12

.preheader12:                                     ; preds = %._crit_edge35.us.3.prol.loopexit, %.preheader12.unr-lcssa
  %71 = icmp sgt i32 %0, 0
  br i1 %71, label %.preheader11.lr.ph, label %._crit_edge19

.preheader11.lr.ph:                               ; preds = %.preheader13.us.prol.loopexit, %.preheader12
  %xtraiter58 = and i32 %0, 1
  %lcmp.mod59 = icmp eq i32 %xtraiter58, 0
  %72 = icmp eq i32 %0, 1
  %wide.trip.count64 = zext i32 %0 to i64
  %wide.trip.count55.1 = zext i32 %0 to i64
  %wide.trip.count69 = zext i32 %0 to i64
  br label %.preheader10.us.us.preheader

.preheader10.us.us.preheader:                     ; preds = %.preheader11.lr.ph, %._crit_edge24.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %._crit_edge24.us ], [ 0, %.preheader11.lr.ph ]
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv66
  br label %.preheader10.us.us

._crit_edge24.us:                                 ; preds = %._crit_edge22.us.us
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next67, %wide.trip.count69
  br i1 %exitcond70, label %.preheader9, label %.preheader10.us.us.preheader

.preheader10.us.us:                               ; preds = %._crit_edge22.us.us, %.preheader10.us.us.preheader
  %indvars.iv61 = phi i64 [ 0, %.preheader10.us.us.preheader ], [ %indvars.iv.next62, %._crit_edge22.us.us ]
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv61, i64 %indvars.iv66
  br i1 %lcmp.mod59, label %.prol.loopexit57, label %.prol.preheader56

.prol.preheader56:                                ; preds = %.preheader10.us.us
  %75 = load double, double* %74, align 8
  %76 = load double, double* %73, align 8
  %77 = fmul double %75, %76
  %78 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv61, i64 0
  %79 = load double, double* %78, align 8
  %80 = fadd double %79, %77
  store double %80, double* %78, align 8
  br label %.prol.loopexit57

.prol.loopexit57:                                 ; preds = %.prol.preheader56, %.preheader10.us.us
  %indvars.iv53.unr.ph = phi i64 [ 1, %.prol.preheader56 ], [ 0, %.preheader10.us.us ]
  br i1 %72, label %._crit_edge22.us.us, label %.preheader10.us.us.new.preheader

.preheader10.us.us.new.preheader:                 ; preds = %.prol.loopexit57
  br label %.preheader10.us.us.new

._crit_edge22.us.us.loopexit:                     ; preds = %.preheader10.us.us.new
  br label %._crit_edge22.us.us

._crit_edge22.us.us:                              ; preds = %._crit_edge22.us.us.loopexit, %.prol.loopexit57
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next62, %wide.trip.count64
  br i1 %exitcond65, label %._crit_edge24.us, label %.preheader10.us.us

.preheader10.us.us.new:                           ; preds = %.preheader10.us.us.new.preheader, %.preheader10.us.us.new
  %indvars.iv53 = phi i64 [ %indvars.iv.next54.1, %.preheader10.us.us.new ], [ %indvars.iv53.unr.ph, %.preheader10.us.us.new.preheader ]
  %81 = load double, double* %74, align 8
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv53, i64 %indvars.iv66
  %83 = load double, double* %82, align 8
  %84 = fmul double %81, %83
  %85 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv61, i64 %indvars.iv53
  %86 = load double, double* %85, align 8
  %87 = fadd double %86, %84
  store double %87, double* %85, align 8
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %88 = load double, double* %74, align 8
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next54, i64 %indvars.iv66
  %90 = load double, double* %89, align 8
  %91 = fmul double %88, %90
  %92 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv61, i64 %indvars.iv.next54
  %93 = load double, double* %92, align 8
  %94 = fadd double %93, %91
  store double %94, double* %92, align 8
  %indvars.iv.next54.1 = add nsw i64 %indvars.iv53, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next54.1, %wide.trip.count55.1
  br i1 %exitcond.1, label %._crit_edge22.us.us.loopexit, label %.preheader10.us.us.new

.preheader9:                                      ; preds = %._crit_edge24.us
  %95 = icmp sgt i32 %0, 0
  br i1 %95, label %.preheader.us.preheader, label %._crit_edge19

.preheader.us.preheader:                          ; preds = %.preheader9
  %96 = add i32 %0, -1
  %xtraiter = and i32 %0, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %97 = icmp ult i32 %96, 3
  %wide.trip.count51 = zext i32 %0 to i64
  %wide.trip.count.3 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv48 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next49, %._crit_edge.us ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %98 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv48, i64 %indvars.iv.prol
  %99 = bitcast double* %98 to i64*
  %100 = load i64, i64* %99, align 8
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv48, i64 %indvars.iv.prol
  %102 = bitcast double* %101 to i64*
  store i64 %100, i64* %102, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  br i1 %97, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new ], [ %indvars.iv.unr, %.preheader.us.new.preheader ]
  %103 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv48, i64 %indvars.iv
  %104 = bitcast double* %103 to i64*
  %105 = load i64, i64* %104, align 8
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv48, i64 %indvars.iv
  %107 = bitcast double* %106 to i64*
  store i64 %105, i64* %107, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %108 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv48, i64 %indvars.iv.next
  %109 = bitcast double* %108 to i64*
  %110 = load i64, i64* %109, align 8
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv48, i64 %indvars.iv.next
  %112 = bitcast double* %111 to i64*
  store i64 %110, i64* %112, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %113 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv48, i64 %indvars.iv.next.1
  %114 = bitcast double* %113 to i64*
  %115 = load i64, i64* %114, align 8
  %116 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv48, i64 %indvars.iv.next.1
  %117 = bitcast double* %116 to i64*
  store i64 %115, i64* %117, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %118 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv48, i64 %indvars.iv.next.2
  %119 = bitcast double* %118 to i64*
  %120 = load i64, i64* %119, align 8
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv48, i64 %indvars.iv.next.2
  %122 = bitcast double* %121 to i64*
  store i64 %120, i64* %122, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next49, %wide.trip.count51
  br i1 %exitcond52, label %._crit_edge19.loopexit, label %.preheader.us

._crit_edge19.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit, %._crit_edge42, %._crit_edge42.thread, %.preheader12, %.preheader9
  %123 = phi i8* [ %50, %.preheader9 ], [ %50, %.preheader12 ], [ %50, %._crit_edge42 ], [ %49, %._crit_edge42.thread ], [ %50, %._crit_edge19.loopexit ]
  tail call void @free(i8* %123) #4
  ret void

._crit_edge35.us.3:                               ; preds = %._crit_edge35.us.3, %._crit_edge35.us.3.preheader.new
  %indvars.iv74 = phi i64 [ %indvars.iv74.unr123, %._crit_edge35.us.3.preheader.new ], [ %indvars.iv.next75.3.1, %._crit_edge35.us.3 ]
  %124 = mul nuw nsw i64 %indvars.iv74, 16000
  %scevgep = getelementptr i8, i8* %50, i64 %124
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %56, i32 8, i1 false)
  %125 = mul i64 %indvars.iv74, 16000
  %126 = add i64 %125, 16000
  %scevgep.1 = getelementptr i8, i8* %50, i64 %126
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %56, i32 8, i1 false)
  %127 = mul i64 %indvars.iv74, 16000
  %128 = add i64 %127, 32000
  %scevgep.2 = getelementptr i8, i8* %50, i64 %128
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %56, i32 8, i1 false)
  %129 = mul i64 %indvars.iv74, 16000
  %130 = add i64 %129, 48000
  %scevgep.3 = getelementptr i8, i8* %50, i64 %130
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %56, i32 8, i1 false)
  %indvars.iv.next75.3 = add nsw i64 %indvars.iv74, 4
  %131 = mul nuw nsw i64 %indvars.iv.next75.3, 16000
  %scevgep.1124 = getelementptr i8, i8* %50, i64 %131
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1124, i8 0, i64 %56, i32 8, i1 false)
  %132 = mul i64 %indvars.iv.next75.3, 16000
  %133 = add i64 %132, 16000
  %scevgep.1.1 = getelementptr i8, i8* %50, i64 %133
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %56, i32 8, i1 false)
  %134 = mul i64 %indvars.iv.next75.3, 16000
  %135 = add i64 %134, 32000
  %scevgep.2.1 = getelementptr i8, i8* %50, i64 %135
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %56, i32 8, i1 false)
  %136 = mul i64 %indvars.iv.next75.3, 16000
  %137 = add i64 %136, 48000
  %scevgep.3.1 = getelementptr i8, i8* %50, i64 %137
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %56, i32 8, i1 false)
  %indvars.iv.next75.3.1 = add nsw i64 %indvars.iv74, 8
  %exitcond.382.1 = icmp eq i64 %indvars.iv.next75.3.1, %wide.trip.count76.3
  br i1 %exitcond.382.1, label %.preheader12.unr-lcssa, label %._crit_edge35.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader12.preheader, label %._crit_edge17

.preheader12.preheader:                           ; preds = %5
  %wide.trip.count107 = zext i32 %0 to i64
  %wide.trip.count100 = zext i32 %0 to i64
  br label %.preheader12

.preheader12:                                     ; preds = %.preheader12.preheader, %._crit_edge42
  %indvars.iv104 = phi i64 [ %indvars.iv.next105, %._crit_edge42 ], [ 0, %.preheader12.preheader ]
  %7 = add i64 %indvars.iv104, 4294967295
  %8 = icmp sgt i64 %indvars.iv104, 0
  br i1 %8, label %.lr.ph33.preheader, label %._crit_edge42

.lr.ph33.preheader:                               ; preds = %.preheader12
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 0
  br label %.lr.ph33

.preheader10:                                     ; preds = %._crit_edge42
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.lr.ph25.preheader, label %._crit_edge17

.lr.ph25.preheader:                               ; preds = %.preheader10
  %wide.trip.count = zext i32 %0 to i64
  br label %.lr.ph25

.lr.ph41:                                         ; preds = %._crit_edge30
  %11 = icmp sgt i64 %indvars.iv104, 0
  br i1 %11, label %.lr.ph41.split.us.preheader, label %._crit_edge42

.lr.ph41.split.us.preheader:                      ; preds = %.lr.ph41
  %xtraiter91109 = and i64 %indvars.iv104, 1
  %lcmp.mod92 = icmp eq i64 %xtraiter91109, 0
  %12 = trunc i64 %7 to i32
  %13 = icmp eq i32 %12, 0
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 0
  br label %.lr.ph41.split.us

.lr.ph41.split.us:                                ; preds = %.lr.ph41.split.us.preheader, %._crit_edge38.us
  %indvars.iv97 = phi i64 [ %indvars.iv.next98, %._crit_edge38.us ], [ %indvars.iv104, %.lr.ph41.split.us.preheader ]
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv97
  %16 = load double, double* %15, align 8
  br i1 %lcmp.mod92, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph41.split.us
  %17 = load double, double* %14, align 8
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv97
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fsub double %16, %20
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph41.split.us
  %indvars.iv86.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph41.split.us ]
  %.135.us.unr.ph = phi double [ %21, %.prol.preheader ], [ %16, %.lr.ph41.split.us ]
  %.lcssa49.unr.ph = phi double [ %21, %.prol.preheader ], [ undef, %.lr.ph41.split.us ]
  br i1 %13, label %._crit_edge38.us, label %.lr.ph41.split.us.new.preheader

.lr.ph41.split.us.new.preheader:                  ; preds = %.prol.loopexit
  br label %.lr.ph41.split.us.new

.lr.ph41.split.us.new:                            ; preds = %.lr.ph41.split.us.new.preheader, %.lr.ph41.split.us.new
  %indvars.iv86 = phi i64 [ %indvars.iv.next87.1, %.lr.ph41.split.us.new ], [ %indvars.iv86.unr.ph, %.lr.ph41.split.us.new.preheader ]
  %.135.us = phi double [ %35, %.lr.ph41.split.us.new ], [ %.135.us.unr.ph, %.lr.ph41.split.us.new.preheader ]
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv86
  %23 = bitcast double* %22 to <2 x double>*
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv86, i64 %indvars.iv97
  %25 = load double, double* %24, align 8
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %26 = load <2 x double>, <2 x double>* %23, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next87, i64 %indvars.iv97
  %28 = load double, double* %27, align 8
  %29 = insertelement <2 x double> undef, double %25, i32 0
  %30 = insertelement <2 x double> %29, double %28, i32 1
  %31 = fmul <2 x double> %26, %30
  %32 = extractelement <2 x double> %31, i32 0
  %33 = extractelement <2 x double> %31, i32 1
  %34 = fsub double %.135.us, %32
  %35 = fsub double %34, %33
  %indvars.iv.next87.1 = add nsw i64 %indvars.iv86, 2
  %exitcond.194 = icmp eq i64 %indvars.iv.next87.1, %indvars.iv104
  br i1 %exitcond.194, label %._crit_edge38.us.loopexit, label %.lr.ph41.split.us.new

._crit_edge38.us.loopexit:                        ; preds = %.lr.ph41.split.us.new
  br label %._crit_edge38.us

._crit_edge38.us:                                 ; preds = %._crit_edge38.us.loopexit, %.prol.loopexit
  %.lcssa49 = phi double [ %.lcssa49.unr.ph, %.prol.loopexit ], [ %35, %._crit_edge38.us.loopexit ]
  store double %.lcssa49, double* %15, align 8
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond101 = icmp eq i64 %indvars.iv.next98, %wide.trip.count100
  br i1 %exitcond101, label %._crit_edge42.loopexit, label %.lr.ph41.split.us

.lr.ph33:                                         ; preds = %.lr.ph33.preheader, %._crit_edge30
  %indvars.iv77 = phi i64 [ %indvars.iv.next78, %._crit_edge30 ], [ 0, %.lr.ph33.preheader ]
  %36 = add i64 %indvars.iv77, 4294967295
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv77
  %38 = load double, double* %37, align 8
  %39 = icmp sgt i64 %indvars.iv77, 0
  br i1 %39, label %.lr.ph29.preheader, label %._crit_edge30

.lr.ph29.preheader:                               ; preds = %.lr.ph33
  %xtraiter72110 = and i64 %indvars.iv77, 1
  %lcmp.mod73 = icmp eq i64 %xtraiter72110, 0
  br i1 %lcmp.mod73, label %.lr.ph29.prol.loopexit, label %.lr.ph29.prol

.lr.ph29.prol:                                    ; preds = %.lr.ph29.preheader
  %40 = load double, double* %9, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv77
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fsub double %38, %43
  br label %.lr.ph29.prol.loopexit

.lr.ph29.prol.loopexit:                           ; preds = %.lr.ph29.prol, %.lr.ph29.preheader
  %indvars.iv67.unr.ph = phi i64 [ 1, %.lr.ph29.prol ], [ 0, %.lr.ph29.preheader ]
  %.027.unr.ph = phi double [ %44, %.lr.ph29.prol ], [ %38, %.lr.ph29.preheader ]
  %.lcssa48.unr.ph = phi double [ %44, %.lr.ph29.prol ], [ undef, %.lr.ph29.preheader ]
  %45 = trunc i64 %36 to i32
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %._crit_edge30, label %.lr.ph29.preheader129

.lr.ph29.preheader129:                            ; preds = %.lr.ph29.prol.loopexit
  br label %.lr.ph29

.lr.ph29:                                         ; preds = %.lr.ph29.preheader129, %.lr.ph29
  %indvars.iv67 = phi i64 [ %indvars.iv.next68.1, %.lr.ph29 ], [ %indvars.iv67.unr.ph, %.lr.ph29.preheader129 ]
  %.027 = phi double [ %60, %.lr.ph29 ], [ %.027.unr.ph, %.lr.ph29.preheader129 ]
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv67
  %48 = bitcast double* %47 to <2 x double>*
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv67, i64 %indvars.iv77
  %50 = load double, double* %49, align 8
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %51 = load <2 x double>, <2 x double>* %48, align 8
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next68, i64 %indvars.iv77
  %53 = load double, double* %52, align 8
  %54 = insertelement <2 x double> undef, double %50, i32 0
  %55 = insertelement <2 x double> %54, double %53, i32 1
  %56 = fmul <2 x double> %51, %55
  %57 = extractelement <2 x double> %56, i32 0
  %58 = extractelement <2 x double> %56, i32 1
  %59 = fsub double %.027, %57
  %60 = fsub double %59, %58
  %indvars.iv.next68.1 = add nsw i64 %indvars.iv67, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next68.1, %indvars.iv77
  br i1 %exitcond.1, label %._crit_edge30.loopexit, label %.lr.ph29

._crit_edge30.loopexit:                           ; preds = %.lr.ph29
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.loopexit, %.lr.ph29.prol.loopexit, %.lr.ph33
  %.0.lcssa = phi double [ %38, %.lr.ph33 ], [ %.lcssa48.unr.ph, %.lr.ph29.prol.loopexit ], [ %60, %._crit_edge30.loopexit ]
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv77, i64 %indvars.iv77
  %62 = load double, double* %61, align 8
  %63 = fdiv double %.0.lcssa, %62
  store double %63, double* %37, align 8
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next78, %indvars.iv104
  br i1 %exitcond85, label %.lr.ph41, label %.lr.ph33

._crit_edge42.loopexit:                           ; preds = %._crit_edge38.us
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit, %.preheader12, %.lr.ph41
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %exitcond108 = icmp eq i64 %indvars.iv.next105, %wide.trip.count107
  br i1 %exitcond108, label %.preheader10, label %.preheader12

.preheader:                                       ; preds = %._crit_edge22
  %64 = icmp sgt i32 %0, 0
  br i1 %64, label %.lr.ph16.preheader, label %._crit_edge17

.lr.ph16.preheader:                               ; preds = %.preheader
  %65 = sext i32 %0 to i64
  %66 = sext i32 %0 to i64
  br label %.lr.ph16

.lr.ph25:                                         ; preds = %.lr.ph25.preheader, %._crit_edge22
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %._crit_edge22 ], [ 0, %.lr.ph25.preheader ]
  %67 = add i64 %indvars.iv63, 4294967295
  %68 = getelementptr inbounds double, double* %2, i64 %indvars.iv63
  %69 = load double, double* %68, align 8
  %70 = icmp sgt i64 %indvars.iv63, 0
  br i1 %70, label %.lr.ph21.preheader, label %._crit_edge22

.lr.ph21.preheader:                               ; preds = %.lr.ph25
  %71 = trunc i64 %indvars.iv63 to i32
  %xtraiter56 = and i32 %71, 3
  %lcmp.mod57 = icmp eq i32 %xtraiter56, 0
  br i1 %lcmp.mod57, label %.lr.ph21.prol.loopexit, label %.lr.ph21.prol.preheader

.lr.ph21.prol.preheader:                          ; preds = %.lr.ph21.preheader
  br label %.lr.ph21.prol

.lr.ph21.prol:                                    ; preds = %.lr.ph21.prol.preheader, %.lr.ph21.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph21.prol ], [ 0, %.lr.ph21.prol.preheader ]
  %.219.prol = phi double [ %77, %.lr.ph21.prol ], [ %69, %.lr.ph21.prol.preheader ]
  %prol.iter59 = phi i32 [ %prol.iter59.sub, %.lr.ph21.prol ], [ %xtraiter56, %.lr.ph21.prol.preheader ]
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv.prol
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds double, double* %4, i64 %indvars.iv.prol
  %75 = load double, double* %74, align 8
  %76 = fmul double %73, %75
  %77 = fsub double %.219.prol, %76
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter59.sub = add i32 %prol.iter59, -1
  %prol.iter59.cmp = icmp eq i32 %prol.iter59.sub, 0
  br i1 %prol.iter59.cmp, label %.lr.ph21.prol.loopexit.loopexit, label %.lr.ph21.prol, !llvm.loop !4

.lr.ph21.prol.loopexit.loopexit:                  ; preds = %.lr.ph21.prol
  br label %.lr.ph21.prol.loopexit

.lr.ph21.prol.loopexit:                           ; preds = %.lr.ph21.prol.loopexit.loopexit, %.lr.ph21.preheader
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph21.preheader ], [ %indvars.iv.next.prol, %.lr.ph21.prol.loopexit.loopexit ]
  %.219.unr = phi double [ %69, %.lr.ph21.preheader ], [ %77, %.lr.ph21.prol.loopexit.loopexit ]
  %.lcssa47.unr = phi double [ undef, %.lr.ph21.preheader ], [ %77, %.lr.ph21.prol.loopexit.loopexit ]
  %78 = trunc i64 %67 to i32
  %79 = icmp ult i32 %78, 3
  br i1 %79, label %._crit_edge22, label %.lr.ph21.preheader128

.lr.ph21.preheader128:                            ; preds = %.lr.ph21.prol.loopexit
  br label %.lr.ph21

.lr.ph21:                                         ; preds = %.lr.ph21.preheader128, %.lr.ph21
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph21 ], [ %indvars.iv.unr, %.lr.ph21.preheader128 ]
  %.219 = phi double [ %101, %.lr.ph21 ], [ %.219.unr, %.lr.ph21.preheader128 ]
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv
  %81 = bitcast double* %80 to <2 x double>*
  %82 = getelementptr inbounds double, double* %4, i64 %indvars.iv
  %83 = bitcast double* %82 to <2 x double>*
  %84 = load <2 x double>, <2 x double>* %81, align 8
  %85 = load <2 x double>, <2 x double>* %83, align 8
  %86 = fmul <2 x double> %84, %85
  %87 = extractelement <2 x double> %86, i32 0
  %88 = extractelement <2 x double> %86, i32 1
  %89 = fsub double %.219, %87
  %90 = fsub double %89, %88
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv.next.1
  %92 = bitcast double* %91 to <2 x double>*
  %93 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next.1
  %94 = bitcast double* %93 to <2 x double>*
  %95 = load <2 x double>, <2 x double>* %92, align 8
  %96 = load <2 x double>, <2 x double>* %94, align 8
  %97 = fmul <2 x double> %95, %96
  %98 = extractelement <2 x double> %97, i32 0
  %99 = extractelement <2 x double> %97, i32 1
  %100 = fsub double %90, %98
  %101 = fsub double %100, %99
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.360 = icmp eq i64 %indvars.iv.next.3, %indvars.iv63
  br i1 %exitcond.360, label %._crit_edge22.loopexit, label %.lr.ph21

._crit_edge22.loopexit:                           ; preds = %.lr.ph21
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge22.loopexit, %.lr.ph21.prol.loopexit, %.lr.ph25
  %.2.lcssa = phi double [ %69, %.lr.ph25 ], [ %.lcssa47.unr, %.lr.ph21.prol.loopexit ], [ %101, %._crit_edge22.loopexit ]
  %102 = getelementptr inbounds double, double* %4, i64 %indvars.iv63
  store double %.2.lcssa, double* %102, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next64, %wide.trip.count
  br i1 %exitcond66, label %.preheader, label %.lr.ph25

.lr.ph16:                                         ; preds = %.lr.ph16.preheader, %._crit_edge
  %indvars.iv52 = phi i64 [ %65, %.lr.ph16.preheader ], [ %indvars.iv.next53, %._crit_edge ]
  %indvar = phi i32 [ 0, %.lr.ph16.preheader ], [ %indvar.next, %._crit_edge ]
  %103 = add nsw i32 %indvar, -1
  %indvars.iv.next53 = add nsw i64 %indvars.iv52, -1
  %104 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next53
  %105 = load double, double* %104, align 8
  %106 = icmp slt i64 %indvars.iv52, %66
  br i1 %106, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.lr.ph16
  %xtraiter = and i32 %indvar, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %indvars.iv50.prol = phi i64 [ %indvars.iv.next51.prol, %.lr.ph.prol ], [ %indvars.iv52, %.lr.ph.prol.preheader ]
  %.313.prol = phi double [ %112, %.lr.ph.prol ], [ %105, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next53, i64 %indvars.iv50.prol
  %108 = load double, double* %107, align 8
  %109 = getelementptr inbounds double, double* %3, i64 %indvars.iv50.prol
  %110 = load double, double* %109, align 8
  %111 = fmul double %108, %110
  %112 = fsub double %.313.prol, %111
  %indvars.iv.next51.prol = add nsw i64 %indvars.iv50.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !5

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %indvars.iv50.unr = phi i64 [ %indvars.iv52, %.lr.ph.preheader ], [ %indvars.iv.next51.prol, %.lr.ph.prol.loopexit.loopexit ]
  %.313.unr = phi double [ %105, %.lr.ph.preheader ], [ %112, %.lr.ph.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph.preheader ], [ %112, %.lr.ph.prol.loopexit.loopexit ]
  %113 = icmp ult i32 %103, 3
  br i1 %113, label %._crit_edge, label %.lr.ph.preheader127

.lr.ph.preheader127:                              ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader127, %.lr.ph
  %indvars.iv50 = phi i64 [ %indvars.iv.next51.3, %.lr.ph ], [ %indvars.iv50.unr, %.lr.ph.preheader127 ]
  %.313 = phi double [ %135, %.lr.ph ], [ %.313.unr, %.lr.ph.preheader127 ]
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next53, i64 %indvars.iv50
  %115 = bitcast double* %114 to <2 x double>*
  %116 = getelementptr inbounds double, double* %3, i64 %indvars.iv50
  %117 = bitcast double* %116 to <2 x double>*
  %118 = load <2 x double>, <2 x double>* %115, align 8
  %119 = load <2 x double>, <2 x double>* %117, align 8
  %120 = fmul <2 x double> %118, %119
  %121 = extractelement <2 x double> %120, i32 0
  %122 = extractelement <2 x double> %120, i32 1
  %123 = fsub double %.313, %121
  %124 = fsub double %123, %122
  %indvars.iv.next51.1 = add nsw i64 %indvars.iv50, 2
  %125 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next53, i64 %indvars.iv.next51.1
  %126 = bitcast double* %125 to <2 x double>*
  %127 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next51.1
  %128 = bitcast double* %127 to <2 x double>*
  %129 = load <2 x double>, <2 x double>* %126, align 8
  %130 = load <2 x double>, <2 x double>* %128, align 8
  %131 = fmul <2 x double> %129, %130
  %132 = extractelement <2 x double> %131, i32 0
  %133 = extractelement <2 x double> %131, i32 1
  %134 = fsub double %124, %132
  %135 = fsub double %134, %133
  %indvars.iv.next51.3 = add nsw i64 %indvars.iv50, 4
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next51.3 to i32
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, %0
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.lr.ph16
  %.3.lcssa = phi double [ %105, %.lr.ph16 ], [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %135, %._crit_edge.loopexit ]
  %136 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next53, i64 %indvars.iv.next53
  %137 = load double, double* %136, align 8
  %138 = fdiv double %.3.lcssa, %137
  %139 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next53
  store double %138, double* %139, align 8
  %140 = icmp sgt i64 %indvars.iv52, 1
  %indvar.next = add nuw nsw i32 %indvar, 1
  br i1 %140, label %.lr.ph16, label %._crit_edge17.loopexit

._crit_edge17.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %5, %.preheader10, %.preheader
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %wide.trip.count2 = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %13
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
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next, %wide.trip.count2
  br i1 %exitcond3, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %13
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
!5 = distinct !{!5, !2}
