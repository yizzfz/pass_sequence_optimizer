; ModuleID = 'A.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %4 to [1000 x double]*
  %7 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, [1000 x double]* %6, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  call fastcc void @kernel_trmm(i32 1000, i32 1200, double %8, [1000 x double]* %6, [1200 x double]* %7)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %.._crit_edge_crit_edge16

.._crit_edge_crit_edge16:                         ; preds = %10
  br label %._crit_edge

; <label>:13:                                     ; preds = %10
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge16, %.._crit_edge_crit_edge, %13
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader.lr.ph, label %.._crit_edge35_crit_edge

.._crit_edge35_crit_edge:                         ; preds = %5
  br label %._crit_edge35

.preheader.lr.ph:                                 ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %1 to double
  %9 = sitofp i32 %0 to double
  br i1 %7, label %.preheader.lr.ph..preheader.us_crit_edge, label %.preheader.lr.ph..preheader_crit_edge

.preheader.lr.ph..preheader_crit_edge:            ; preds = %.preheader.lr.ph
  %wide.trip.count72 = zext i32 %0 to i64
  br label %.preheader

.preheader.lr.ph..preheader.us_crit_edge:         ; preds = %.preheader.lr.ph
  %xtraiter50 = and i32 %1, 1
  %lcmp.mod51 = icmp eq i32 %xtraiter50, 0
  %10 = icmp eq i32 %1, 1
  %wide.trip.count58 = zext i32 %0 to i64
  %wide.trip.count47.1 = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge32.us..preheader.us_crit_edge, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv56 = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next57, %._crit_edge32.us..preheader.us_crit_edge ]
  %11 = add nuw i64 %indvars.iv56, 4294967295
  %12 = icmp sgt i64 %indvars.iv56, 0
  br i1 %12, label %.lr.ph.us, label %.preheader.us.._crit_edge.us_crit_edge

.preheader.us.._crit_edge.us_crit_edge:           ; preds = %.preheader.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.prol.loopexit.._crit_edge.us_crit_edge, %.lr.ph.us.new.._crit_edge.us_crit_edge, %.preheader.us.._crit_edge.us_crit_edge
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv56, i64 %indvars.iv56
  store double 1.000000e+00, double* %13, align 8
  %14 = trunc i64 %indvars.iv56 to i32
  %15 = add i32 %14, %1
  br i1 %lcmp.mod51, label %._crit_edge.us..prol.loopexit49_crit_edge, label %.prol.preheader48

._crit_edge.us..prol.loopexit49_crit_edge:        ; preds = %._crit_edge.us
  br label %.prol.loopexit49

.prol.preheader48:                                ; preds = %._crit_edge.us
  %16 = srem i32 %15, %1
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv56, i64 0
  store double %18, double* %19, align 8
  br label %.prol.loopexit49

.prol.loopexit49:                                 ; preds = %._crit_edge.us..prol.loopexit49_crit_edge, %.prol.preheader48
  %indvars.iv45.unr.ph = phi i64 [ 1, %.prol.preheader48 ], [ 0, %._crit_edge.us..prol.loopexit49_crit_edge ]
  br i1 %10, label %.prol.loopexit49.._crit_edge32.us_crit_edge, label %.prol.loopexit49.._crit_edge.us.new_crit_edge

.prol.loopexit49.._crit_edge.us.new_crit_edge:    ; preds = %.prol.loopexit49
  br label %._crit_edge.us.new

.prol.loopexit49.._crit_edge32.us_crit_edge:      ; preds = %.prol.loopexit49
  br label %._crit_edge32.us

._crit_edge.us.new:                               ; preds = %._crit_edge.us.new.._crit_edge.us.new_crit_edge, %.prol.loopexit49.._crit_edge.us.new_crit_edge
  %indvars.iv45 = phi i64 [ %indvars.iv45.unr.ph, %.prol.loopexit49.._crit_edge.us.new_crit_edge ], [ %indvars.iv.next46.1, %._crit_edge.us.new.._crit_edge.us.new_crit_edge ]
  %20 = trunc i64 %indvars.iv45 to i32
  %21 = sub i32 %15, %20
  %22 = srem i32 %21, %1
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, %8
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv56, i64 %indvars.iv45
  store double %24, double* %25, align 8
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %26 = trunc i64 %indvars.iv.next46 to i32
  %27 = sub i32 %15, %26
  %28 = srem i32 %27, %1
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, %8
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv56, i64 %indvars.iv.next46
  store double %30, double* %31, align 8
  %indvars.iv.next46.1 = add nuw nsw i64 %indvars.iv45, 2
  %exitcond.153 = icmp eq i64 %indvars.iv.next46.1, %wide.trip.count47.1
  br i1 %exitcond.153, label %._crit_edge.us.new.._crit_edge32.us_crit_edge, label %._crit_edge.us.new.._crit_edge.us.new_crit_edge

._crit_edge.us.new.._crit_edge.us.new_crit_edge:  ; preds = %._crit_edge.us.new
  br label %._crit_edge.us.new

._crit_edge.us.new.._crit_edge32.us_crit_edge:    ; preds = %._crit_edge.us.new
  br label %._crit_edge32.us

.lr.ph.us.new:                                    ; preds = %.prol.loopexit..lr.ph.us.new_crit_edge, %.lr.ph.us.new..lr.ph.us.new_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.new..lr.ph.us.new_crit_edge ], [ %indvars.iv.unr.ph, %.prol.loopexit..lr.ph.us.new_crit_edge ]
  %32 = add nuw nsw i64 %indvars.iv, %indvars.iv56
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, %0
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %35, %9
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv56, i64 %indvars.iv
  store double %36, double* %37, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %38 = add nuw nsw i64 %indvars.iv.next, %indvars.iv56
  %39 = trunc i64 %38 to i32
  %40 = srem i32 %39, %0
  %41 = sitofp i32 %40 to double
  %42 = fdiv double %41, %9
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv56, i64 %indvars.iv.next
  store double %42, double* %43, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv56
  br i1 %exitcond.1, label %.lr.ph.us.new.._crit_edge.us_crit_edge, label %.lr.ph.us.new..lr.ph.us.new_crit_edge

.lr.ph.us.new..lr.ph.us.new_crit_edge:            ; preds = %.lr.ph.us.new
  br label %.lr.ph.us.new

.lr.ph.us.new.._crit_edge.us_crit_edge:           ; preds = %.lr.ph.us.new
  br label %._crit_edge.us

.lr.ph.us:                                        ; preds = %.preheader.us
  %xtraiter75 = and i64 %indvars.iv56, 1
  %lcmp.mod = icmp eq i64 %xtraiter75, 0
  br i1 %lcmp.mod, label %.lr.ph.us..prol.loopexit_crit_edge, label %.prol.preheader

.lr.ph.us..prol.loopexit_crit_edge:               ; preds = %.lr.ph.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph.us
  %44 = trunc i64 %indvars.iv56 to i32
  %45 = srem i32 %44, %0
  %46 = sitofp i32 %45 to double
  %47 = fdiv double %46, %9
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv56, i64 0
  store double %47, double* %48, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us..prol.loopexit_crit_edge ]
  %49 = trunc i64 %11 to i32
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %.prol.loopexit.._crit_edge.us_crit_edge, label %.prol.loopexit..lr.ph.us.new_crit_edge

.prol.loopexit..lr.ph.us.new_crit_edge:           ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

.prol.loopexit.._crit_edge.us_crit_edge:          ; preds = %.prol.loopexit
  br label %._crit_edge.us

._crit_edge32.us:                                 ; preds = %._crit_edge.us.new.._crit_edge32.us_crit_edge, %.prol.loopexit49.._crit_edge32.us_crit_edge
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond = icmp eq i64 %indvars.iv.next57, %wide.trip.count58
  br i1 %exitcond, label %._crit_edge32.us.._crit_edge35_crit_edge, label %._crit_edge32.us..preheader.us_crit_edge

._crit_edge32.us..preheader.us_crit_edge:         ; preds = %._crit_edge32.us
  br label %.preheader.us

._crit_edge32.us.._crit_edge35_crit_edge:         ; preds = %._crit_edge32.us
  br label %._crit_edge35

.preheader:                                       ; preds = %._crit_edge..preheader_crit_edge, %.preheader.lr.ph..preheader_crit_edge
  %indvars.iv70 = phi i64 [ 0, %.preheader.lr.ph..preheader_crit_edge ], [ %indvars.iv.next71, %._crit_edge..preheader_crit_edge ]
  %51 = add nuw i64 %indvars.iv70, 4294967295
  %52 = icmp sgt i64 %indvars.iv70, 0
  br i1 %52, label %.lr.ph, label %.preheader.._crit_edge_crit_edge

.preheader.._crit_edge_crit_edge:                 ; preds = %.preheader
  br label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %xtraiter6674 = and i64 %indvars.iv70, 1
  %lcmp.mod67 = icmp eq i64 %xtraiter6674, 0
  br i1 %lcmp.mod67, label %.lr.ph..prol.loopexit65_crit_edge, label %.prol.preheader64

.lr.ph..prol.loopexit65_crit_edge:                ; preds = %.lr.ph
  br label %.prol.loopexit65

.prol.preheader64:                                ; preds = %.lr.ph
  %53 = trunc i64 %indvars.iv70 to i32
  %54 = srem i32 %53, %0
  %55 = sitofp i32 %54 to double
  %56 = fdiv double %55, %9
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv70, i64 0
  store double %56, double* %57, align 8
  br label %.prol.loopexit65

.prol.loopexit65:                                 ; preds = %.lr.ph..prol.loopexit65_crit_edge, %.prol.preheader64
  %indvars.iv59.unr.ph = phi i64 [ 1, %.prol.preheader64 ], [ 0, %.lr.ph..prol.loopexit65_crit_edge ]
  %58 = trunc i64 %51 to i32
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %.prol.loopexit65.._crit_edge_crit_edge, label %.prol.loopexit65..lr.ph.new_crit_edge

.prol.loopexit65..lr.ph.new_crit_edge:            ; preds = %.prol.loopexit65
  br label %.lr.ph.new

.prol.loopexit65.._crit_edge_crit_edge:           ; preds = %.prol.loopexit65
  br label %._crit_edge

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.prol.loopexit65..lr.ph.new_crit_edge
  %indvars.iv59 = phi i64 [ %indvars.iv59.unr.ph, %.prol.loopexit65..lr.ph.new_crit_edge ], [ %indvars.iv.next60.1, %.lr.ph.new..lr.ph.new_crit_edge ]
  %60 = add nuw nsw i64 %indvars.iv59, %indvars.iv70
  %61 = trunc i64 %60 to i32
  %62 = srem i32 %61, %0
  %63 = sitofp i32 %62 to double
  %64 = fdiv double %63, %9
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv70, i64 %indvars.iv59
  store double %64, double* %65, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %66 = add nuw nsw i64 %indvars.iv.next60, %indvars.iv70
  %67 = trunc i64 %66 to i32
  %68 = srem i32 %67, %0
  %69 = sitofp i32 %68 to double
  %70 = fdiv double %69, %9
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv70, i64 %indvars.iv.next60
  store double %70, double* %71, align 8
  %indvars.iv.next60.1 = add nuw nsw i64 %indvars.iv59, 2
  %exitcond63.1 = icmp eq i64 %indvars.iv.next60.1, %indvars.iv70
  br i1 %exitcond63.1, label %.lr.ph.new.._crit_edge_crit_edge, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  br label %.lr.ph.new

.lr.ph.new.._crit_edge_crit_edge:                 ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph.new.._crit_edge_crit_edge, %.prol.loopexit65.._crit_edge_crit_edge, %.preheader.._crit_edge_crit_edge
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv70, i64 %indvars.iv70
  store double 1.000000e+00, double* %72, align 8
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next71, %wide.trip.count72
  br i1 %exitcond73, label %._crit_edge.._crit_edge35_crit_edge, label %._crit_edge..preheader_crit_edge

._crit_edge..preheader_crit_edge:                 ; preds = %._crit_edge
  br label %.preheader

._crit_edge.._crit_edge35_crit_edge:              ; preds = %._crit_edge
  br label %._crit_edge35

._crit_edge35:                                    ; preds = %._crit_edge.._crit_edge35_crit_edge, %._crit_edge32.us.._crit_edge35_crit_edge, %.._crit_edge35_crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  %7 = icmp sgt i32 %1, 0
  %or.cond = and i1 %6, %7
  br i1 %or.cond, label %.preheader27.us.preheader, label %.._crit_edge31_crit_edge

.._crit_edge31_crit_edge:                         ; preds = %5
  br label %._crit_edge31

.preheader27.us.preheader:                        ; preds = %5
  %8 = add i32 %1, -1
  %9 = add i32 %0, 1
  %10 = add i32 %0, -2
  %11 = sext i32 %0 to i64
  %wide.trip.count52 = zext i32 %1 to i64
  %wide.trip.count46.1 = zext i32 %0 to i64
  %xtraiter = and i32 %1, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %12 = icmp ult i32 %8, 3
  %13 = add nsw i32 %xtraiter, -1
  %14 = zext i32 %13 to i64
  %15 = add nuw nsw i64 %14, 1
  %16 = add nsw i64 %wide.trip.count52, -4
  %broadcast.splatinsert67 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat68 = shufflevector <2 x double> %broadcast.splatinsert67, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader27.us

.preheader27.us:                                  ; preds = %..loopexit_crit_edge.us..preheader27.us_crit_edge, %.preheader27.us.preheader
  %indvars.iv53 = phi i64 [ 0, %.preheader27.us.preheader ], [ %indvars.iv.next54, %..loopexit_crit_edge.us..preheader27.us_crit_edge ]
  %indvars.iv42 = phi i64 [ 1, %.preheader27.us.preheader ], [ %indvars.iv.next43, %..loopexit_crit_edge.us..preheader27.us_crit_edge ]
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %17 = icmp slt i64 %indvars.iv.next54, %11
  br i1 %17, label %.preheader27.us..preheader.us.us_crit_edge, label %.preheader.us32.preheader

.preheader27.us..preheader.us.us_crit_edge:       ; preds = %.preheader27.us
  %18 = sub nsw i64 0, %indvars.iv53
  %19 = trunc i64 %18 to i32
  %20 = add i32 %9, %19
  %xtraiter47 = and i32 %20, 1
  %lcmp.mod48 = icmp eq i32 %xtraiter47, 0
  %21 = sub i32 0, %19
  %22 = icmp eq i32 %10, %21
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv42, i64 %indvars.iv53
  %indvars.iv.next45.prol = add nuw nsw i64 %indvars.iv42, 1
  br label %.preheader.us.us

.preheader.us32.preheader:                        ; preds = %.preheader27.us
  br i1 %lcmp.mod, label %.preheader.us32.preheader..preheader.us32.prol.loopexit_crit_edge, label %.preheader.us32.preheader..preheader.us32.prol_crit_edge

.preheader.us32.preheader..preheader.us32.prol_crit_edge: ; preds = %.preheader.us32.preheader
  br label %.preheader.us32.prol

.preheader.us32.preheader..preheader.us32.prol.loopexit_crit_edge: ; preds = %.preheader.us32.preheader
  br label %.preheader.us32.prol.loopexit

.preheader.us32.prol:                             ; preds = %.preheader.us32.preheader..preheader.us32.prol_crit_edge, %.preheader.us32.prol..preheader.us32.prol_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.preheader.us32.prol..preheader.us32.prol_crit_edge ], [ 0, %.preheader.us32.preheader..preheader.us32.prol_crit_edge ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.preheader.us32.prol..preheader.us32.prol_crit_edge ], [ %xtraiter, %.preheader.us32.preheader..preheader.us32.prol_crit_edge ]
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.prol
  %25 = load double, double* %24, align 8
  %26 = fmul double %25, %2
  store double %26, double* %24, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.us32.prol..preheader.us32.prol.loopexit_crit_edge, label %.preheader.us32.prol..preheader.us32.prol_crit_edge, !llvm.loop !1

.preheader.us32.prol..preheader.us32.prol.loopexit_crit_edge: ; preds = %.preheader.us32.prol
  br label %.preheader.us32.prol.loopexit

.preheader.us32.prol..preheader.us32.prol_crit_edge: ; preds = %.preheader.us32.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %.preheader.us32.prol

.preheader.us32.prol.loopexit:                    ; preds = %.preheader.us32.prol..preheader.us32.prol.loopexit_crit_edge, %.preheader.us32.preheader..preheader.us32.prol.loopexit_crit_edge
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us32.preheader..preheader.us32.prol.loopexit_crit_edge ], [ %15, %.preheader.us32.prol..preheader.us32.prol.loopexit_crit_edge ]
  br i1 %12, label %.preheader.us32.prol.loopexit...loopexit_crit_edge.us_crit_edge, label %.preheader.us32.preheader60

.preheader.us32.prol.loopexit...loopexit_crit_edge.us_crit_edge: ; preds = %.preheader.us32.prol.loopexit
  br label %..loopexit_crit_edge.us

.preheader.us32.preheader60:                      ; preds = %.preheader.us32.prol.loopexit
  %27 = sub nsw i64 %16, %indvars.iv.unr
  %28 = lshr i64 %27, 2
  %29 = add nuw nsw i64 %28, 1
  %min.iters.check = icmp ult i64 %29, 2
  br i1 %min.iters.check, label %.preheader.us32.preheader60..preheader.us32_crit_edge, label %min.iters.checked

.preheader.us32.preheader60..preheader.us32_crit_edge: ; preds = %.preheader.us32.preheader60
  br label %.preheader.us32.preheader69

min.iters.checked:                                ; preds = %.preheader.us32.preheader60
  %n.mod.vf = and i64 %29, 1
  %n.vec = sub nsw i64 %29, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %30 = add nsw i64 %indvars.iv.unr, 4
  %31 = shl nuw i64 %28, 2
  %32 = add i64 %30, %31
  %33 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %32, %33
  br i1 %cmp.zero, label %min.iters.checked..preheader.us32_crit_edge, label %vector.ph

min.iters.checked..preheader.us32_crit_edge:      ; preds = %min.iters.checked
  br label %.preheader.us32.preheader69

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %34 = shl i64 %index, 2
  %35 = add i64 %indvars.iv.unr, %34
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %35
  %37 = bitcast double* %36 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %37, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec64 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec65 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec66 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %38 = fmul <2 x double> %strided.vec, %broadcast.splat68
  %39 = fmul <2 x double> %strided.vec64, %broadcast.splat68
  %40 = fmul <2 x double> %strided.vec65, %broadcast.splat68
  %41 = add nsw i64 %35, 3
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %41
  %43 = fmul <2 x double> %strided.vec66, %broadcast.splat68
  %44 = getelementptr double, double* %42, i64 -3
  %45 = bitcast double* %44 to <8 x double>*
  %46 = shufflevector <2 x double> %38, <2 x double> %39, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %47 = shufflevector <2 x double> %40, <2 x double> %43, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %46, <4 x double> %47, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %45, align 8
  %index.next = add i64 %index, 2
  %48 = icmp eq i64 %index.next, %n.vec
  br i1 %48, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !3

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %middle.block...loopexit_crit_edge.us_crit_edge, label %middle.block..preheader.us32_crit_edge

middle.block..preheader.us32_crit_edge:           ; preds = %middle.block
  br label %.preheader.us32.preheader69

.preheader.us32.preheader69:                      ; preds = %.preheader.us32.preheader60..preheader.us32_crit_edge, %min.iters.checked..preheader.us32_crit_edge, %middle.block..preheader.us32_crit_edge
  %indvars.iv.ph = phi i64 [ %ind.end, %middle.block..preheader.us32_crit_edge ], [ %indvars.iv.unr, %min.iters.checked..preheader.us32_crit_edge ], [ %indvars.iv.unr, %.preheader.us32.preheader60..preheader.us32_crit_edge ]
  br label %.preheader.us32

middle.block...loopexit_crit_edge.us_crit_edge:   ; preds = %middle.block
  br label %..loopexit_crit_edge.us

.preheader.us32:                                  ; preds = %.preheader.us32.preheader69, %.preheader.us32..preheader.us32_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us32..preheader.us32_crit_edge ], [ %indvars.iv.ph, %.preheader.us32.preheader69 ]
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv
  %50 = load double, double* %49, align 8
  %51 = fmul double %50, %2
  store double %51, double* %49, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %2
  store double %54, double* %52, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next.1
  %56 = load double, double* %55, align 8
  %57 = fmul double %56, %2
  store double %57, double* %55, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next.2
  %59 = load double, double* %58, align 8
  %60 = fmul double %59, %2
  store double %60, double* %58, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count52
  br i1 %exitcond.3, label %.preheader.us32...loopexit_crit_edge.us_crit_edge, label %.preheader.us32..preheader.us32_crit_edge, !llvm.loop !6

.preheader.us32..preheader.us32_crit_edge:        ; preds = %.preheader.us32
  br label %.preheader.us32

.preheader.us32...loopexit_crit_edge.us_crit_edge: ; preds = %.preheader.us32
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us:                          ; preds = %._crit_edge.us.us...loopexit_crit_edge.us_crit_edge, %.preheader.us32...loopexit_crit_edge.us_crit_edge, %middle.block...loopexit_crit_edge.us_crit_edge, %.preheader.us32.prol.loopexit...loopexit_crit_edge.us_crit_edge
  %exitcond56 = icmp eq i64 %indvars.iv.next54, %wide.trip.count46.1
  br i1 %exitcond56, label %..loopexit_crit_edge.us.._crit_edge31_crit_edge, label %..loopexit_crit_edge.us..preheader27.us_crit_edge

..loopexit_crit_edge.us.._crit_edge31_crit_edge:  ; preds = %..loopexit_crit_edge.us
  br label %._crit_edge31

..loopexit_crit_edge.us..preheader27.us_crit_edge: ; preds = %..loopexit_crit_edge.us
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  br label %.preheader27.us

.preheader.us.us:                                 ; preds = %._crit_edge.us.us..preheader.us.us_crit_edge, %.preheader27.us..preheader.us.us_crit_edge
  %indvars.iv50 = phi i64 [ 0, %.preheader27.us..preheader.us.us_crit_edge ], [ %indvars.iv.next51, %._crit_edge.us.us..preheader.us.us_crit_edge ]
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv50
  %.pre = load double, double* %61, align 8
  br i1 %lcmp.mod48, label %.preheader.us.us..prol.loopexit_crit_edge, label %.prol.preheader

.preheader.us.us..prol.loopexit_crit_edge:        ; preds = %.preheader.us.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.preheader.us.us
  %62 = load double, double* %23, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv42, i64 %indvars.iv50
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = fadd double %.pre, %65
  store double %66, double* %61, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us.us..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv44.unr.ph = phi i64 [ %indvars.iv.next45.prol, %.prol.preheader ], [ %indvars.iv42, %.preheader.us.us..prol.loopexit_crit_edge ]
  %.unr.ph = phi double [ %66, %.prol.preheader ], [ %.pre, %.preheader.us.us..prol.loopexit_crit_edge ]
  %.lcssa.unr.ph = phi double [ %66, %.prol.preheader ], [ undef, %.preheader.us.us..prol.loopexit_crit_edge ]
  br i1 %22, label %.prol.loopexit.._crit_edge.us.us_crit_edge, label %.prol.loopexit..preheader.us.us.new_crit_edge

.prol.loopexit..preheader.us.us.new_crit_edge:    ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

.prol.loopexit.._crit_edge.us.us_crit_edge:       ; preds = %.prol.loopexit
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.preheader.us.us.new.._crit_edge.us.us_crit_edge, %.prol.loopexit.._crit_edge.us.us_crit_edge
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit.._crit_edge.us.us_crit_edge ], [ %80, %.preheader.us.us.new.._crit_edge.us.us_crit_edge ]
  %67 = fmul double %.lcssa, %2
  store double %67, double* %61, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond = icmp eq i64 %indvars.iv.next51, %wide.trip.count52
  br i1 %exitcond, label %._crit_edge.us.us...loopexit_crit_edge.us_crit_edge, label %._crit_edge.us.us..preheader.us.us_crit_edge

._crit_edge.us.us..preheader.us.us_crit_edge:     ; preds = %._crit_edge.us.us
  br label %.preheader.us.us

._crit_edge.us.us...loopexit_crit_edge.us_crit_edge: ; preds = %._crit_edge.us.us
  br label %..loopexit_crit_edge.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new..preheader.us.us.new_crit_edge, %.prol.loopexit..preheader.us.us.new_crit_edge
  %indvars.iv44 = phi i64 [ %indvars.iv44.unr.ph, %.prol.loopexit..preheader.us.us.new_crit_edge ], [ %indvars.iv.next45.1, %.preheader.us.us.new..preheader.us.us.new_crit_edge ]
  %68 = phi double [ %.unr.ph, %.prol.loopexit..preheader.us.us.new_crit_edge ], [ %80, %.preheader.us.us.new..preheader.us.us.new_crit_edge ]
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv44, i64 %indvars.iv53
  %70 = load double, double* %69, align 8
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv44, i64 %indvars.iv50
  %72 = load double, double* %71, align 8
  %73 = fmul double %70, %72
  %74 = fadd double %68, %73
  store double %74, double* %61, align 8
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next45, i64 %indvars.iv53
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next45, i64 %indvars.iv50
  %78 = load double, double* %77, align 8
  %79 = fmul double %76, %78
  %80 = fadd double %74, %79
  store double %80, double* %61, align 8
  %indvars.iv.next45.1 = add nsw i64 %indvars.iv44, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next45.1, %wide.trip.count46.1
  br i1 %exitcond.1, label %.preheader.us.us.new.._crit_edge.us.us_crit_edge, label %.preheader.us.us.new..preheader.us.us.new_crit_edge

.preheader.us.us.new..preheader.us.us.new_crit_edge: ; preds = %.preheader.us.us.new
  br label %.preheader.us.us.new

.preheader.us.us.new.._crit_edge.us.us_crit_edge: ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge31:                                    ; preds = %..loopexit_crit_edge.us.._crit_edge31_crit_edge, %.._crit_edge31_crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %.._crit_edge14_crit_edge

.._crit_edge14_crit_edge:                         ; preds = %3
  br label %._crit_edge14

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count18 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next17, %._crit_edge.us..preheader.us_crit_edge ]
  %11 = mul nsw i64 %indvars.iv16, %10
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge.._crit_edge21_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.._crit_edge21_crit_edge ]
  %12 = add nsw i64 %indvars.iv, %11
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge21.._crit_edge_crit_edge

._crit_edge21.._crit_edge_crit_edge:              ; preds = %._crit_edge21
  br label %._crit_edge

; <label>:16:                                     ; preds = %._crit_edge21
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge21.._crit_edge_crit_edge, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge.._crit_edge21_crit_edge

._crit_edge.._crit_edge21_crit_edge:              ; preds = %._crit_edge
  br label %._crit_edge21

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, %wide.trip.count18
  br i1 %exitcond19, label %._crit_edge.us.._crit_edge14_crit_edge, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge.us.._crit_edge14_crit_edge:           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge.us.._crit_edge14_crit_edge, %.._crit_edge14_crit_edge
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
