; ModuleID = 'A.ll'
source_filename = "2mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"D\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 960000, i32 8) #4
  %10 = bitcast i8* %6 to [1100 x double]*
  %11 = bitcast i8* %7 to [900 x double]*
  %12 = bitcast i8* %8 to [1200 x double]*
  %13 = bitcast i8* %9 to [1200 x double]*
  call fastcc void @init_array(i32 800, i32 900, i32 1100, i32 1200, double* nonnull %3, double* nonnull %4, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  call void (...) @polybench_timer_start() #4
  %14 = load double, double* %3, align 8
  %15 = load double, double* %4, align 8
  %16 = bitcast i8* %5 to [900 x double]*
  %17 = bitcast i8* %9 to [1200 x double]*
  call fastcc void @kernel_2mm(i32 800, i32 900, i32 1100, i32 1200, double %14, double %15, [900 x double]* %16, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %17)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %18 = icmp sgt i32 %0, 42
  br i1 %18, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %2
  %20 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %20, align 1
  %21 = icmp eq i8 %strcmpload, 0
  br i1 %21, label %22, label %._crit_edge

; <label>:22:                                     ; preds = %19
  %23 = bitcast i8* %9 to [1200 x double]*
  call fastcc void @print_array(i32 800, i32 1200, [1200 x double]* %23)
  br label %._crit_edge

._crit_edge:                                      ; preds = %19, %2, %22
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  call void @free(i8* %8) #4
  call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, i32, double*, double*, [1100 x double]*, [900 x double]*, [1200 x double]*, [1200 x double]*) unnamed_addr #2 {
  store double 1.500000e+00, double* %4, align 8
  store double 1.200000e+00, double* %5, align 8
  %11 = icmp sgt i32 %0, 0
  br i1 %11, label %._crit_edge.lr.ph, label %._crit_edge8

._crit_edge.lr.ph:                                ; preds = %10
  %wide.trip.count85 = zext i32 %2 to i64
  %12 = icmp sgt i32 %2, 0
  %13 = sext i32 %0 to i64
  %14 = sitofp i32 %0 to double
  br i1 %12, label %._crit_edge.us.preheader, label %._crit_edge8

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge46.us
  %indvars.iv87 = phi i64 [ %indvars.iv.next88, %._crit_edge46.us ], [ 0, %._crit_edge.us.preheader ]
  br label %15

; <label>:15:                                     ; preds = %15, %._crit_edge.us
  %indvars.iv83 = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next84, %15 ]
  %16 = mul nsw i64 %indvars.iv87, %indvars.iv83
  %17 = add nsw i64 %16, 1
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, %0
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, %14
  %22 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv87, i64 %indvars.iv83
  store double %21, double* %22, align 8
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %exitcond86 = icmp eq i64 %indvars.iv.next84, %wide.trip.count85
  br i1 %exitcond86, label %._crit_edge46.us, label %15

._crit_edge46.us:                                 ; preds = %15
  %indvars.iv.next88 = add nsw i64 %indvars.iv87, 1
  %23 = icmp slt i64 %indvars.iv.next88, %13
  br i1 %23, label %._crit_edge.us, label %._crit_edge8.loopexit

._crit_edge8.loopexit:                            ; preds = %._crit_edge46.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %._crit_edge.lr.ph, %10
  %24 = icmp sgt i32 %2, 0
  br i1 %24, label %._crit_edge9.lr.ph, label %._crit_edge10

._crit_edge9.lr.ph:                               ; preds = %._crit_edge8
  %wide.trip.count77 = zext i32 %1 to i64
  %25 = icmp sgt i32 %1, 0
  %26 = sext i32 %2 to i64
  br i1 %25, label %._crit_edge9.us.preheader, label %._crit_edge10

._crit_edge9.us.preheader:                        ; preds = %._crit_edge9.lr.ph
  %27 = sitofp i32 %1 to double
  %xtraiter = and i64 %wide.trip.count77, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %28 = icmp eq i32 %1, 1
  %29 = insertelement <2 x double> undef, double %27, i32 0
  %30 = insertelement <2 x double> %29, double %27, i32 1
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us.preheader, %._crit_edge36.us
  %indvars.iv79 = phi i64 [ 0, %._crit_edge9.us.preheader ], [ %indvars.iv.next80, %._crit_edge36.us ]
  br i1 %lcmp.mod, label %.prol.loopexit.unr-lcssa, label %.prol.preheader

.prol.preheader:                                  ; preds = %._crit_edge9.us
  br label %31

; <label>:31:                                     ; preds = %.prol.preheader
  %32 = trunc i64 %indvars.iv79 to i32
  %33 = srem i32 %32, %1
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %34, %27
  %36 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv79, i64 0
  store double %35, double* %36, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %._crit_edge9.us, %31
  %indvars.iv75.unr.ph = phi i64 [ 1, %31 ], [ 0, %._crit_edge9.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %28, label %._crit_edge36.us, label %._crit_edge9.us.new

._crit_edge9.us.new:                              ; preds = %.prol.loopexit
  br label %37

; <label>:37:                                     ; preds = %37, %._crit_edge9.us.new
  %indvars.iv75 = phi i64 [ %indvars.iv75.unr.ph, %._crit_edge9.us.new ], [ %indvars.iv.next76.1, %37 ]
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %38 = mul nsw i64 %indvars.iv79, %indvars.iv.next76
  %39 = trunc i64 %38 to i32
  %40 = srem i32 %39, %1
  %41 = sitofp i32 %40 to double
  %42 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv79, i64 %indvars.iv75
  %indvars.iv.next76.1 = add nsw i64 %indvars.iv75, 2
  %43 = mul nsw i64 %indvars.iv79, %indvars.iv.next76.1
  %44 = trunc i64 %43 to i32
  %45 = srem i32 %44, %1
  %46 = sitofp i32 %45 to double
  %47 = insertelement <2 x double> undef, double %41, i32 0
  %48 = insertelement <2 x double> %47, double %46, i32 1
  %49 = fdiv <2 x double> %48, %30
  %50 = bitcast double* %42 to <2 x double>*
  store <2 x double> %49, <2 x double>* %50, align 8
  %exitcond78.1 = icmp eq i64 %indvars.iv.next76.1, %wide.trip.count77
  br i1 %exitcond78.1, label %._crit_edge36.us.unr-lcssa, label %37

._crit_edge36.us.unr-lcssa:                       ; preds = %37
  br label %._crit_edge36.us

._crit_edge36.us:                                 ; preds = %.prol.loopexit, %._crit_edge36.us.unr-lcssa
  %indvars.iv.next80 = add nsw i64 %indvars.iv79, 1
  %51 = icmp slt i64 %indvars.iv.next80, %26
  br i1 %51, label %._crit_edge9.us, label %._crit_edge10.loopexit

._crit_edge10.loopexit:                           ; preds = %._crit_edge36.us
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %._crit_edge9.lr.ph, %._crit_edge8
  %52 = icmp sgt i32 %1, 0
  br i1 %52, label %._crit_edge11.lr.ph, label %._crit_edge12

._crit_edge11.lr.ph:                              ; preds = %._crit_edge10
  %wide.trip.count69 = zext i32 %3 to i64
  %53 = icmp sgt i32 %3, 0
  %54 = sext i32 %1 to i64
  br i1 %53, label %._crit_edge11.us.preheader, label %._crit_edge12

._crit_edge11.us.preheader:                       ; preds = %._crit_edge11.lr.ph
  %55 = sitofp i32 %3 to double
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.preheader, %._crit_edge26.us
  %indvars.iv71 = phi i64 [ 0, %._crit_edge11.us.preheader ], [ %indvars.iv.next72, %._crit_edge26.us ]
  br label %56

; <label>:56:                                     ; preds = %56, %._crit_edge11.us
  %indvars.iv67 = phi i64 [ 0, %._crit_edge11.us ], [ %indvars.iv.next68, %56 ]
  %57 = add nuw nsw i64 %indvars.iv67, 3
  %58 = mul nsw i64 %indvars.iv71, %57
  %59 = add nsw i64 %58, 1
  %60 = trunc i64 %59 to i32
  %61 = srem i32 %60, %3
  %62 = sitofp i32 %61 to double
  %63 = fdiv double %62, %55
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %8, i64 %indvars.iv71, i64 %indvars.iv67
  store double %63, double* %64, align 8
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next68, %wide.trip.count69
  br i1 %exitcond70, label %._crit_edge26.us, label %56

._crit_edge26.us:                                 ; preds = %56
  %indvars.iv.next72 = add nsw i64 %indvars.iv71, 1
  %65 = icmp slt i64 %indvars.iv.next72, %54
  br i1 %65, label %._crit_edge11.us, label %._crit_edge12.loopexit

._crit_edge12.loopexit:                           ; preds = %._crit_edge26.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %._crit_edge11.lr.ph, %._crit_edge10
  %66 = icmp sgt i32 %0, 0
  br i1 %66, label %._crit_edge13.lr.ph, label %.loopexit

._crit_edge13.lr.ph:                              ; preds = %._crit_edge12
  %wide.trip.count = zext i32 %3 to i64
  %67 = icmp sgt i32 %3, 0
  %68 = sext i32 %0 to i64
  %69 = sitofp i32 %2 to double
  br i1 %67, label %._crit_edge13.us.preheader, label %.loopexit

._crit_edge13.us.preheader:                       ; preds = %._crit_edge13.lr.ph
  br label %._crit_edge13.us

._crit_edge13.us:                                 ; preds = %._crit_edge13.us.preheader, %._crit_edge18.us
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge18.us ], [ 0, %._crit_edge13.us.preheader ]
  br label %70

; <label>:70:                                     ; preds = %70, %._crit_edge13.us
  %indvars.iv = phi i64 [ 0, %._crit_edge13.us ], [ %indvars.iv.next, %70 ]
  %71 = add nuw nsw i64 %indvars.iv, 2
  %72 = mul nsw i64 %indvars.iv65, %71
  %73 = trunc i64 %72 to i32
  %74 = srem i32 %73, %2
  %75 = sitofp i32 %74 to double
  %76 = fdiv double %75, %69
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv65, i64 %indvars.iv
  store double %76, double* %77, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge18.us, label %70

._crit_edge18.us:                                 ; preds = %70
  %indvars.iv.next66 = add nsw i64 %indvars.iv65, 1
  %78 = icmp slt i64 %indvars.iv.next66, %68
  br i1 %78, label %._crit_edge13.us, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge18.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge13.lr.ph, %._crit_edge12
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(i32, i32, i32, i32, double, double, [900 x double]*, [1100 x double]*, [900 x double]*, [1200 x double]*, [1200 x double]*) unnamed_addr #2 {
  %12 = icmp sgt i32 %0, 0
  br i1 %12, label %._crit_edge.lr.ph, label %.loopexit

._crit_edge.lr.ph:                                ; preds = %11
  %wide.trip.count96 = zext i32 %1 to i64
  %13 = icmp sgt i32 %1, 0
  %wide.trip.count92.1 = zext i32 %2 to i64
  %14 = sext i32 %0 to i64
  br i1 %13, label %._crit_edge.us.preheader, label %._crit_edge7.lr.ph

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  %15 = add i32 %1, -1
  %16 = zext i32 %15 to i64
  %17 = shl nuw nsw i64 %16, 3
  %18 = add nuw nsw i64 %17, 8
  %xtraiter109 = and i32 %2, 1
  %19 = icmp sgt i32 %2, 0
  %20 = icmp eq i32 %xtraiter109, 0
  %21 = icmp eq i32 %2, 1
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge43.us
  %indvars.iv100 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next101, %._crit_edge43.us ]
  %indvar = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvar.next, %._crit_edge43.us ]
  br i1 %19, label %.lr.ph37.us.us.preheader, label %.lr.ph42..lr.ph42.split_crit_edge.us.preheader

.lr.ph37.us.us.preheader:                         ; preds = %._crit_edge.us
  %22 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv100, i64 0
  br label %.lr.ph37.us.us

.lr.ph42..lr.ph42.split_crit_edge.us.preheader:   ; preds = %._crit_edge.us
  %scevgep = getelementptr [900 x double], [900 x double]* %6, i64 %indvar, i64 0
  %23 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %23, i8 0, i64 %18, i32 8, i1 false)
  br label %._crit_edge43.us

._crit_edge43.us.loopexit:                        ; preds = %._crit_edge38.us.us
  br label %._crit_edge43.us

._crit_edge43.us:                                 ; preds = %._crit_edge43.us.loopexit, %.lr.ph42..lr.ph42.split_crit_edge.us.preheader
  %indvars.iv.next101 = add nsw i64 %indvars.iv100, 1
  %24 = icmp slt i64 %indvars.iv.next101, %14
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %24, label %._crit_edge.us, label %._crit_edge7.lr.ph.loopexit

.lr.ph37.us.us:                                   ; preds = %.lr.ph37.us.us.preheader, %._crit_edge38.us.us
  %indvars.iv94 = phi i64 [ %indvars.iv.next95, %._crit_edge38.us.us ], [ 0, %.lr.ph37.us.us.preheader ]
  %25 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv100, i64 %indvars.iv94
  store double 0.000000e+00, double* %25, align 8
  br i1 %20, label %.prol.loopexit108, label %26

; <label>:26:                                     ; preds = %.lr.ph37.us.us
  %27 = load double, double* %22, align 8
  %28 = fmul double %27, %4
  %29 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 0, i64 %indvars.iv94
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fadd double %31, 0.000000e+00
  store double %32, double* %25, align 8
  br label %.prol.loopexit108

.prol.loopexit108:                                ; preds = %.lr.ph37.us.us, %26
  %33 = phi double [ %32, %26 ], [ 0.000000e+00, %.lr.ph37.us.us ]
  %indvars.iv90.unr.ph = phi i64 [ 1, %26 ], [ 0, %.lr.ph37.us.us ]
  br i1 %21, label %._crit_edge38.us.us, label %.lr.ph37.us.us.new.preheader

.lr.ph37.us.us.new.preheader:                     ; preds = %.prol.loopexit108
  br label %.lr.ph37.us.us.new

._crit_edge38.us.us.loopexit:                     ; preds = %.lr.ph37.us.us.new
  br label %._crit_edge38.us.us

._crit_edge38.us.us:                              ; preds = %._crit_edge38.us.us.loopexit, %.prol.loopexit108
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94, 1
  %exitcond97 = icmp eq i64 %indvars.iv.next95, %wide.trip.count96
  br i1 %exitcond97, label %._crit_edge43.us.loopexit, label %.lr.ph37.us.us

.lr.ph37.us.us.new:                               ; preds = %.lr.ph37.us.us.new.preheader, %.lr.ph37.us.us.new
  %34 = phi double [ %48, %.lr.ph37.us.us.new ], [ %33, %.lr.ph37.us.us.new.preheader ]
  %indvars.iv90 = phi i64 [ %indvars.iv.next91.1, %.lr.ph37.us.us.new ], [ %indvars.iv90.unr.ph, %.lr.ph37.us.us.new.preheader ]
  %35 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv100, i64 %indvars.iv90
  %36 = load double, double* %35, align 8
  %37 = fmul double %36, %4
  %38 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv90, i64 %indvars.iv94
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fadd double %40, %34
  store double %41, double* %25, align 8
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  %42 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv100, i64 %indvars.iv.next91
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, %4
  %45 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv.next91, i64 %indvars.iv94
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fadd double %47, %41
  store double %48, double* %25, align 8
  %indvars.iv.next91.1 = add nuw nsw i64 %indvars.iv90, 2
  %exitcond93.1 = icmp eq i64 %indvars.iv.next91.1, %wide.trip.count92.1
  br i1 %exitcond93.1, label %._crit_edge38.us.us.loopexit, label %.lr.ph37.us.us.new

._crit_edge7.lr.ph.loopexit:                      ; preds = %._crit_edge43.us
  br label %._crit_edge7.lr.ph

._crit_edge7.lr.ph:                               ; preds = %._crit_edge7.lr.ph.loopexit, %._crit_edge.lr.ph
  %wide.trip.count80 = zext i32 %3 to i64
  %49 = icmp sgt i32 %3, 0
  br i1 %49, label %._crit_edge7.us.preheader, label %.loopexit

._crit_edge7.us.preheader:                        ; preds = %._crit_edge7.lr.ph
  %50 = add i32 %3, -1
  %51 = and i32 %3, 3
  %52 = add nsw i32 %51, -1
  %53 = zext i32 %52 to i64
  %54 = add nuw nsw i64 %53, 1
  %55 = and i32 %1, 1
  %56 = add nsw i64 %wide.trip.count80, -4
  %57 = icmp sgt i32 %1, 0
  %58 = icmp eq i32 %55, 0
  %59 = icmp eq i32 %1, 1
  %60 = icmp eq i32 %51, 0
  %61 = icmp ult i32 %50, 3
  %62 = insertelement <2 x double> undef, double %5, i32 0
  %63 = insertelement <2 x double> %62, double %5, i32 1
  %64 = insertelement <2 x double> undef, double %5, i32 0
  %65 = insertelement <2 x double> %64, double %5, i32 1
  %broadcast.splatinsert120 = insertelement <2 x double> undef, double %5, i32 0
  %broadcast.splat121 = shufflevector <2 x double> %broadcast.splatinsert120, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %._crit_edge7.us.preheader, %._crit_edge13.us
  %indvars.iv82 = phi i64 [ 0, %._crit_edge7.us.preheader ], [ %indvars.iv.next83, %._crit_edge13.us ]
  br i1 %57, label %.lr.ph.us.us.preheader, label %.lr.ph12..lr.ph12.split_crit_edge.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %._crit_edge7.us
  %66 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv82, i64 0
  br label %.lr.ph.us.us

.lr.ph12..lr.ph12.split_crit_edge.us.preheader:   ; preds = %._crit_edge7.us
  br i1 %60, label %.lr.ph12..lr.ph12.split_crit_edge.us.prol.loopexit, label %.lr.ph12..lr.ph12.split_crit_edge.us.prol.preheader

.lr.ph12..lr.ph12.split_crit_edge.us.prol.preheader: ; preds = %.lr.ph12..lr.ph12.split_crit_edge.us.preheader
  br label %.lr.ph12..lr.ph12.split_crit_edge.us.prol

.lr.ph12..lr.ph12.split_crit_edge.us.prol:        ; preds = %.lr.ph12..lr.ph12.split_crit_edge.us.prol.preheader, %.lr.ph12..lr.ph12.split_crit_edge.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph12..lr.ph12.split_crit_edge.us.prol ], [ 0, %.lr.ph12..lr.ph12.split_crit_edge.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph12..lr.ph12.split_crit_edge.us.prol ], [ %51, %.lr.ph12..lr.ph12.split_crit_edge.us.prol.preheader ]
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv82, i64 %indvars.iv.prol
  %68 = load double, double* %67, align 8
  %69 = fmul double %68, %5
  store double %69, double* %67, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph12..lr.ph12.split_crit_edge.us.prol.loopexit.loopexit, label %.lr.ph12..lr.ph12.split_crit_edge.us.prol, !llvm.loop !1

.lr.ph12..lr.ph12.split_crit_edge.us.prol.loopexit.loopexit: ; preds = %.lr.ph12..lr.ph12.split_crit_edge.us.prol
  br label %.lr.ph12..lr.ph12.split_crit_edge.us.prol.loopexit

.lr.ph12..lr.ph12.split_crit_edge.us.prol.loopexit: ; preds = %.lr.ph12..lr.ph12.split_crit_edge.us.prol.loopexit.loopexit, %.lr.ph12..lr.ph12.split_crit_edge.us.preheader
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph12..lr.ph12.split_crit_edge.us.preheader ], [ %54, %.lr.ph12..lr.ph12.split_crit_edge.us.prol.loopexit.loopexit ]
  br i1 %61, label %._crit_edge13.us, label %.lr.ph12..lr.ph12.split_crit_edge.us.preheader115

.lr.ph12..lr.ph12.split_crit_edge.us.preheader115: ; preds = %.lr.ph12..lr.ph12.split_crit_edge.us.prol.loopexit
  %70 = sub nsw i64 %56, %indvars.iv.unr
  %71 = lshr i64 %70, 2
  %72 = add nuw nsw i64 %71, 1
  %min.iters.check = icmp ult i64 %72, 2
  br i1 %min.iters.check, label %.lr.ph12..lr.ph12.split_crit_edge.us.preheader123, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph12..lr.ph12.split_crit_edge.us.preheader115
  %n.mod.vf = and i64 %72, 1
  %n.vec = sub nsw i64 %72, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %73 = add nsw i64 %indvars.iv.unr, 4
  %74 = shl nuw i64 %71, 2
  %75 = add i64 %73, %74
  %76 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %75, %76
  br i1 %cmp.zero, label %.lr.ph12..lr.ph12.split_crit_edge.us.preheader123, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %77 = shl i64 %index, 2
  %78 = add i64 %indvars.iv.unr, %77
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv82, i64 %78
  %80 = bitcast double* %79 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %80, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec117 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec118 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec119 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %81 = fmul <2 x double> %strided.vec, %broadcast.splat121
  %82 = fmul <2 x double> %strided.vec117, %broadcast.splat121
  %83 = fmul <2 x double> %strided.vec118, %broadcast.splat121
  %84 = add nsw i64 %78, 3
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv82, i64 %84
  %86 = fmul <2 x double> %strided.vec119, %broadcast.splat121
  %87 = getelementptr double, double* %85, i64 -3
  %88 = bitcast double* %87 to <8 x double>*
  %89 = shufflevector <2 x double> %81, <2 x double> %82, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %90 = shufflevector <2 x double> %83, <2 x double> %86, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %89, <4 x double> %90, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %88, align 8
  %index.next = add i64 %index, 2
  %91 = icmp eq i64 %index.next, %n.vec
  br i1 %91, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge13.us, label %.lr.ph12..lr.ph12.split_crit_edge.us.preheader123

.lr.ph12..lr.ph12.split_crit_edge.us.preheader123: ; preds = %middle.block, %min.iters.checked, %.lr.ph12..lr.ph12.split_crit_edge.us.preheader115
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked ], [ %indvars.iv.unr, %.lr.ph12..lr.ph12.split_crit_edge.us.preheader115 ], [ %ind.end, %middle.block ]
  br label %.lr.ph12..lr.ph12.split_crit_edge.us

.lr.ph12..lr.ph12.split_crit_edge.us:             ; preds = %.lr.ph12..lr.ph12.split_crit_edge.us.preheader123, %.lr.ph12..lr.ph12.split_crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph12..lr.ph12.split_crit_edge.us ], [ %indvars.iv.ph, %.lr.ph12..lr.ph12.split_crit_edge.us.preheader123 ]
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv82, i64 %indvars.iv
  %93 = bitcast double* %92 to <2 x double>*
  %94 = load <2 x double>, <2 x double>* %93, align 8
  %95 = fmul <2 x double> %94, %63
  %96 = bitcast double* %92 to <2 x double>*
  store <2 x double> %95, <2 x double>* %96, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv82, i64 %indvars.iv.next.1
  %98 = bitcast double* %97 to <2 x double>*
  %99 = load <2 x double>, <2 x double>* %98, align 8
  %100 = fmul <2 x double> %99, %65
  %101 = bitcast double* %97 to <2 x double>*
  store <2 x double> %100, <2 x double>* %101, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count80
  br i1 %exitcond.3, label %._crit_edge13.us.loopexit124, label %.lr.ph12..lr.ph12.split_crit_edge.us, !llvm.loop !6

._crit_edge13.us.loopexit:                        ; preds = %._crit_edge10.us.us
  br label %._crit_edge13.us

._crit_edge13.us.loopexit124:                     ; preds = %.lr.ph12..lr.ph12.split_crit_edge.us
  br label %._crit_edge13.us

._crit_edge13.us:                                 ; preds = %._crit_edge13.us.loopexit124, %._crit_edge13.us.loopexit, %middle.block, %.lr.ph12..lr.ph12.split_crit_edge.us.prol.loopexit
  %indvars.iv.next83 = add nsw i64 %indvars.iv82, 1
  %102 = icmp slt i64 %indvars.iv.next83, %14
  br i1 %102, label %._crit_edge7.us, label %.loopexit.loopexit

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge10.us.us
  %indvars.iv78 = phi i64 [ %indvars.iv.next79, %._crit_edge10.us.us ], [ 0, %.lr.ph.us.us.preheader ]
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv82, i64 %indvars.iv78
  %104 = load double, double* %103, align 8
  %105 = fmul double %104, %5
  store double %105, double* %103, align 8
  br i1 %58, label %.prol.loopexit, label %106

; <label>:106:                                    ; preds = %.lr.ph.us.us
  %107 = load double, double* %66, align 8
  %108 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 0, i64 %indvars.iv78
  %109 = load double, double* %108, align 8
  %110 = fmul double %107, %109
  %111 = fadd double %110, %105
  store double %111, double* %103, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us, %106
  %112 = phi double [ %111, %106 ], [ %105, %.lr.ph.us.us ]
  %indvars.iv74.unr.ph = phi i64 [ 1, %106 ], [ 0, %.lr.ph.us.us ]
  br i1 %59, label %._crit_edge10.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge10.us.us.loopexit:                     ; preds = %.lr.ph.us.us.new
  br label %._crit_edge10.us.us

._crit_edge10.us.us:                              ; preds = %._crit_edge10.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next79, %wide.trip.count80
  br i1 %exitcond81, label %._crit_edge13.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %113 = phi double [ %125, %.lr.ph.us.us.new ], [ %112, %.lr.ph.us.us.new.preheader ]
  %indvars.iv74 = phi i64 [ %indvars.iv.next75.1, %.lr.ph.us.us.new ], [ %indvars.iv74.unr.ph, %.lr.ph.us.us.new.preheader ]
  %114 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv82, i64 %indvars.iv74
  %115 = load double, double* %114, align 8
  %116 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv74, i64 %indvars.iv78
  %117 = load double, double* %116, align 8
  %118 = fmul double %115, %117
  %119 = fadd double %118, %113
  store double %119, double* %103, align 8
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %120 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv82, i64 %indvars.iv.next75
  %121 = load double, double* %120, align 8
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv.next75, i64 %indvars.iv78
  %123 = load double, double* %122, align 8
  %124 = fmul double %121, %123
  %125 = fadd double %124, %119
  store double %125, double* %103, align 8
  %indvars.iv.next75.1 = add nuw nsw i64 %indvars.iv74, 2
  %exitcond77.1 = icmp eq i64 %indvars.iv.next75.1, %wide.trip.count96
  br i1 %exitcond77.1, label %._crit_edge10.us.us.loopexit, label %.lr.ph.us.us.new

.loopexit.loopexit:                               ; preds = %._crit_edge13.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge7.lr.ph, %11
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]*) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %._crit_edge.lr.ph, label %.loopexit

._crit_edge.lr.ph:                                ; preds = %3
  %wide.trip.count = zext i32 %1 to i64
  %9 = icmp sgt i32 %1, 0
  %10 = sext i32 %0 to i64
  br i1 %9, label %._crit_edge.us.preheader, label %.loopexit

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge4.us
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %._crit_edge4.us ], [ 0, %._crit_edge.us.preheader ]
  %11 = mul nsw i64 %10, %indvars.iv13
  br label %12

; <label>:12:                                     ; preds = %._crit_edge2.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %13 = add nsw i64 %11, %indvars.iv
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %._crit_edge2.us

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #6
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %12, %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge4.us, label %12

._crit_edge4.us:                                  ; preds = %._crit_edge2.us
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %23 = icmp slt i64 %indvars.iv.next14, %10
  br i1 %23, label %._crit_edge.us, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge4.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge.lr.ph, %3
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #6
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
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
