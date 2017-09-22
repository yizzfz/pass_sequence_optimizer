; ModuleID = 'B.ll'
source_filename = "doitgen.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline norecurse nounwind uwtable
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture readonly, double* nocapture) local_unnamed_addr #0 {
  %7 = sext i32 %2 to i64
  %8 = sext i32 %1 to i64
  %9 = sext i32 %0 to i64
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.preheader13.lr.ph, label %._crit_edge40

.preheader13.lr.ph:                               ; preds = %6
  %wide.trip.count = zext i32 %2 to i64
  %11 = add nsw i64 %7, -1
  %12 = shl nsw i64 %7, 3
  %13 = icmp sgt i32 %1, 0
  %14 = icmp sgt i32 %2, 0
  %15 = icmp eq i32 %2, 0
  %16 = bitcast double* %5 to i8*
  %xtraiter50 = and i64 %7, 3
  %lcmp.mod51 = icmp eq i64 %xtraiter50, 0
  %17 = icmp ult i64 %11, 3
  %xtraiter44 = and i64 %wide.trip.count, 1
  %lcmp.mod45 = icmp eq i64 %xtraiter44, 0
  %18 = icmp eq i32 %2, 1
  %sunkaddr58 = ptrtoint double* %5 to i64
  %19 = add nsw i64 %8, -1
  %xtraiter = and i64 %8, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %20 = icmp ult i64 %19, 7
  br label %.preheader13

.preheader13:                                     ; preds = %._crit_edge26, %.preheader13.lr.ph
  %indvars.iv1037 = phi i64 [ 0, %.preheader13.lr.ph ], [ %indvars.iv.next11, %._crit_edge26 ]
  br i1 %13, label %.preheader12.lr.ph, label %._crit_edge26

.preheader12.lr.ph:                               ; preds = %.preheader13
  br i1 %14, label %.preheader12.us.preheader, label %.preheader12.preheader

.preheader12.preheader:                           ; preds = %.preheader12.lr.ph
  br i1 %lcmp.mod, label %.preheader12.prol.loopexit, label %.preheader12.prol.preheader

.preheader12.prol.preheader:                      ; preds = %.preheader12.preheader
  br label %.preheader12.prol

.preheader12.prol:                                ; preds = %.preheader12.prol, %.preheader12.prol.preheader
  %indvars.iv822.prol = phi i64 [ %indvars.iv.next9.prol, %.preheader12.prol ], [ 0, %.preheader12.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader12.prol ], [ %xtraiter, %.preheader12.prol.preheader ]
  %indvars.iv.next9.prol = add nuw nsw i64 %indvars.iv822.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader12.prol.loopexit.unr-lcssa, label %.preheader12.prol, !llvm.loop !1

.preheader12.prol.loopexit.unr-lcssa:             ; preds = %.preheader12.prol
  br label %.preheader12.prol.loopexit

.preheader12.prol.loopexit:                       ; preds = %.preheader12.prol.loopexit.unr-lcssa, %.preheader12.preheader
  %indvars.iv822.unr = phi i64 [ 0, %.preheader12.preheader ], [ %indvars.iv.next9.prol, %.preheader12.prol.loopexit.unr-lcssa ]
  br i1 %20, label %._crit_edge26.loopexit73, label %.preheader12.preheader.new

.preheader12.preheader.new:                       ; preds = %.preheader12.prol.loopexit
  br label %.preheader12

.preheader12.us.preheader:                        ; preds = %.preheader12.lr.ph
  br label %.preheader12.us

.preheader12.us:                                  ; preds = %._crit_edge21.us, %.preheader12.us.preheader
  %indvars.iv822.us = phi i64 [ %indvars.iv.next9.us, %._crit_edge21.us ], [ 0, %.preheader12.us.preheader ]
  br i1 %15, label %..preheader_crit_edge.us.loopexit, label %.lr.ph.us33.preheader

.lr.ph.us33.preheader:                            ; preds = %.preheader12.us
  %21 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1037, i64 %indvars.iv822.us, i64 0
  br label %.lr.ph.us33

._crit_edge21.us.loopexit:                        ; preds = %.lr.ph20.us
  br label %._crit_edge21.us

._crit_edge21.us:                                 ; preds = %.lr.ph20.us.prol.loopexit, %._crit_edge21.us.loopexit
  %indvars.iv.next9.us = add nuw nsw i64 %indvars.iv822.us, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next9.us, %8
  br i1 %exitcond53, label %._crit_edge26.loopexit, label %.preheader12.us

.lr.ph20.us:                                      ; preds = %.lr.ph20.us.preheader72, %.lr.ph20.us
  %indvars.iv619.us = phi i64 [ %indvars.iv.next7.us.3, %.lr.ph20.us ], [ %indvars.iv619.us.unr, %.lr.ph20.us.preheader72 ]
  %22 = getelementptr inbounds double, double* %5, i64 %indvars.iv619.us
  %23 = bitcast double* %22 to i64*
  %24 = load i64, i64* %23, align 8
  %25 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1037, i64 %indvars.iv822.us, i64 %indvars.iv619.us
  %26 = bitcast double* %25 to i64*
  store i64 %24, i64* %26, align 8
  %indvars.iv.next7.us = add nuw nsw i64 %indvars.iv619.us, 1
  %27 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next7.us
  %28 = bitcast double* %27 to i64*
  %29 = load i64, i64* %28, align 8
  %30 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1037, i64 %indvars.iv822.us, i64 %indvars.iv.next7.us
  %31 = bitcast double* %30 to i64*
  store i64 %29, i64* %31, align 8
  %indvars.iv.next7.us.1 = add nsw i64 %indvars.iv619.us, 2
  %32 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next7.us.1
  %33 = bitcast double* %32 to i64*
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1037, i64 %indvars.iv822.us, i64 %indvars.iv.next7.us.1
  %36 = bitcast double* %35 to i64*
  store i64 %34, i64* %36, align 8
  %indvars.iv.next7.us.2 = add nsw i64 %indvars.iv619.us, 3
  %37 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next7.us.2
  %38 = bitcast double* %37 to i64*
  %39 = load i64, i64* %38, align 8
  %40 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1037, i64 %indvars.iv822.us, i64 %indvars.iv.next7.us.2
  %41 = bitcast double* %40 to i64*
  store i64 %39, i64* %41, align 8
  %indvars.iv.next7.us.3 = add nuw nsw i64 %indvars.iv619.us, 4
  %exitcond48.3 = icmp eq i64 %indvars.iv.next7.us.3, %7
  br i1 %exitcond48.3, label %._crit_edge21.us.loopexit, label %.lr.ph20.us

.lr.ph.us33:                                      ; preds = %._crit_edge.us34, %.lr.ph.us33.preheader
  %indvars.iv416.us27 = phi i64 [ %indvars.iv.next5.us32, %._crit_edge.us34 ], [ 0, %.lr.ph.us33.preheader ]
  %42 = getelementptr inbounds double, double* %5, i64 %indvars.iv416.us27
  store double 0.000000e+00, double* %42, align 8
  br i1 %lcmp.mod45, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us33
  %43 = load double, double* %21, align 8
  %44 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv416.us27
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %sunkaddr55 = shl i64 %indvars.iv416.us27, 3
  %sunkaddr56 = add i64 %sunkaddr58, %sunkaddr55
  %sunkaddr57 = inttoptr i64 %sunkaddr56 to double*
  %47 = load double, double* %sunkaddr57, align 8
  %48 = fadd double %47, %46
  store double %48, double* %sunkaddr57, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us33
  %indvars.iv15.us28.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us33 ]
  br i1 %18, label %._crit_edge.us34, label %.lr.ph.us33.new.preheader

.lr.ph.us33.new.preheader:                        ; preds = %.prol.loopexit
  %sunkaddr59 = shl i64 %indvars.iv416.us27, 3
  %sunkaddr60 = add i64 %sunkaddr58, %sunkaddr59
  %sunkaddr61 = inttoptr i64 %sunkaddr60 to double*
  %.pre = load double, double* %sunkaddr61, align 8
  br label %.lr.ph.us33.new

.lr.ph.us33.new:                                  ; preds = %.lr.ph.us33.new, %.lr.ph.us33.new.preheader
  %49 = phi double [ %61, %.lr.ph.us33.new ], [ %.pre, %.lr.ph.us33.new.preheader ]
  %indvars.iv15.us28 = phi i64 [ %indvars.iv.next.us29.1, %.lr.ph.us33.new ], [ %indvars.iv15.us28.unr.ph, %.lr.ph.us33.new.preheader ]
  %50 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1037, i64 %indvars.iv822.us, i64 %indvars.iv15.us28
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv15.us28, i64 %indvars.iv416.us27
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = fadd double %49, %54
  store double %55, double* %sunkaddr61, align 8
  %indvars.iv.next.us29 = add nuw nsw i64 %indvars.iv15.us28, 1
  %56 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1037, i64 %indvars.iv822.us, i64 %indvars.iv.next.us29
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next.us29, i64 %indvars.iv416.us27
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = fadd double %55, %60
  store double %61, double* %sunkaddr61, align 8
  %indvars.iv.next.us29.1 = add nuw nsw i64 %indvars.iv15.us28, 2
  %exitcond.us30.1 = icmp eq i64 %indvars.iv.next.us29.1, %wide.trip.count
  br i1 %exitcond.us30.1, label %._crit_edge.us34.loopexit, label %.lr.ph.us33.new

._crit_edge.us34.loopexit:                        ; preds = %.lr.ph.us33.new
  br label %._crit_edge.us34

._crit_edge.us34:                                 ; preds = %._crit_edge.us34.loopexit, %.prol.loopexit
  %indvars.iv.next5.us32 = add nuw nsw i64 %indvars.iv416.us27, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next5.us32, %7
  br i1 %exitcond46, label %.lr.ph20.us.preheader.loopexit, label %.lr.ph.us33

..preheader_crit_edge.us.loopexit:                ; preds = %.preheader12.us
  call void @llvm.memset.p0i8.i64(i8* %16, i8 0, i64 %12, i32 8, i1 false)
  br label %.lr.ph20.us.preheader

.lr.ph20.us.preheader.loopexit:                   ; preds = %._crit_edge.us34
  br label %.lr.ph20.us.preheader

.lr.ph20.us.preheader:                            ; preds = %.lr.ph20.us.preheader.loopexit, %..preheader_crit_edge.us.loopexit
  br i1 %lcmp.mod51, label %.lr.ph20.us.prol.loopexit, label %.lr.ph20.us.prol.preheader

.lr.ph20.us.prol.preheader:                       ; preds = %.lr.ph20.us.preheader
  br label %.lr.ph20.us.prol

.lr.ph20.us.prol:                                 ; preds = %.lr.ph20.us.prol, %.lr.ph20.us.prol.preheader
  %indvars.iv619.us.prol = phi i64 [ %indvars.iv.next7.us.prol, %.lr.ph20.us.prol ], [ 0, %.lr.ph20.us.prol.preheader ]
  %prol.iter52 = phi i64 [ %prol.iter52.sub, %.lr.ph20.us.prol ], [ %xtraiter50, %.lr.ph20.us.prol.preheader ]
  %62 = getelementptr inbounds double, double* %5, i64 %indvars.iv619.us.prol
  %63 = bitcast double* %62 to i64*
  %64 = load i64, i64* %63, align 8
  %65 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1037, i64 %indvars.iv822.us, i64 %indvars.iv619.us.prol
  %66 = bitcast double* %65 to i64*
  store i64 %64, i64* %66, align 8
  %indvars.iv.next7.us.prol = add nuw nsw i64 %indvars.iv619.us.prol, 1
  %prol.iter52.sub = add nsw i64 %prol.iter52, -1
  %prol.iter52.cmp = icmp eq i64 %prol.iter52.sub, 0
  br i1 %prol.iter52.cmp, label %.lr.ph20.us.prol.loopexit.loopexit, label %.lr.ph20.us.prol, !llvm.loop !3

.lr.ph20.us.prol.loopexit.loopexit:               ; preds = %.lr.ph20.us.prol
  br label %.lr.ph20.us.prol.loopexit

.lr.ph20.us.prol.loopexit:                        ; preds = %.lr.ph20.us.prol.loopexit.loopexit, %.lr.ph20.us.preheader
  %indvars.iv619.us.unr = phi i64 [ 0, %.lr.ph20.us.preheader ], [ %xtraiter50, %.lr.ph20.us.prol.loopexit.loopexit ]
  br i1 %17, label %._crit_edge21.us, label %.lr.ph20.us.preheader72

.lr.ph20.us.preheader72:                          ; preds = %.lr.ph20.us.prol.loopexit
  br label %.lr.ph20.us

.preheader12:                                     ; preds = %.preheader12, %.preheader12.preheader.new
  %indvars.iv822 = phi i64 [ %indvars.iv822.unr, %.preheader12.preheader.new ], [ %indvars.iv.next9.7, %.preheader12 ]
  %indvars.iv.next9.7 = add nsw i64 %indvars.iv822, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next9.7, %8
  br i1 %exitcond.7, label %._crit_edge26.loopexit73.unr-lcssa, label %.preheader12

._crit_edge26.loopexit:                           ; preds = %._crit_edge21.us
  br label %._crit_edge26

._crit_edge26.loopexit73.unr-lcssa:               ; preds = %.preheader12
  br label %._crit_edge26.loopexit73

._crit_edge26.loopexit73:                         ; preds = %._crit_edge26.loopexit73.unr-lcssa, %.preheader12.prol.loopexit
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26.loopexit73, %._crit_edge26.loopexit, %.preheader13
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv1037, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next11, %9
  br i1 %exitcond54, label %._crit_edge40.loopexit, label %.preheader13

._crit_edge40.loopexit:                           ; preds = %._crit_edge26
  br label %._crit_edge40

._crit_edge40:                                    ; preds = %._crit_edge40.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #1 {
  %3 = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  tail call fastcc void @init_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7, double* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %10
  tail call fastcc void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6)
  br label %14

; <label>:14:                                     ; preds = %13, %10, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture) unnamed_addr #0 {
  %6 = sext i32 %2 to i64
  %7 = sext i32 %1 to i64
  %8 = sext i32 %0 to i64
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader14.lr.ph, label %.preheader12

.preheader14.lr.ph:                               ; preds = %5
  %10 = icmp sgt i32 %1, 0
  %11 = sitofp i32 %2 to double
  br i1 %10, label %.preheader14.us.preheader, label %.preheader12

.preheader14.us.preheader:                        ; preds = %.preheader14.lr.ph
  %12 = icmp sgt i32 %2, 0
  %xtraiter46 = and i64 %6, 1
  %lcmp.mod47 = icmp eq i64 %xtraiter46, 0
  %13 = icmp eq i32 %2, 1
  br label %.preheader14.us

.preheader14.us:                                  ; preds = %._crit_edge25.us, %.preheader14.us.preheader
  %indvars.iv1026.us = phi i64 [ %indvars.iv.next11.us, %._crit_edge25.us ], [ 0, %.preheader14.us.preheader ]
  br i1 %12, label %.preheader13.us.us.preheader, label %._crit_edge25.us

.preheader13.us.us.preheader:                     ; preds = %.preheader14.us
  br label %.preheader13.us.us

._crit_edge25.us.loopexit:                        ; preds = %._crit_edge22.us.us
  br label %._crit_edge25.us

._crit_edge25.us:                                 ; preds = %._crit_edge25.us.loopexit, %.preheader14.us
  %indvars.iv.next11.us = add nuw nsw i64 %indvars.iv1026.us, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next11.us, %8
  br i1 %exitcond49, label %.preheader12.loopexit, label %.preheader14.us

.preheader13.us.us:                               ; preds = %._crit_edge22.us.us, %.preheader13.us.us.preheader
  %indvars.iv823.us.us = phi i64 [ %indvars.iv.next9.us.us, %._crit_edge22.us.us ], [ 0, %.preheader13.us.us.preheader ]
  %14 = mul nuw nsw i64 %indvars.iv823.us.us, %indvars.iv1026.us
  br i1 %lcmp.mod47, label %.prol.loopexit45, label %.prol.preheader44

.prol.preheader44:                                ; preds = %.preheader13.us.us
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, %2
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %11
  %19 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1026.us, i64 %indvars.iv823.us.us, i64 0
  store double %18, double* %19, align 8
  br label %.prol.loopexit45

.prol.loopexit45:                                 ; preds = %.prol.preheader44, %.preheader13.us.us
  %indvars.iv620.us.us.unr.ph = phi i64 [ 1, %.prol.preheader44 ], [ 0, %.preheader13.us.us ]
  br i1 %13, label %._crit_edge22.us.us, label %.preheader13.us.us.new.preheader

.preheader13.us.us.new.preheader:                 ; preds = %.prol.loopexit45
  br label %.preheader13.us.us.new

._crit_edge22.us.us.loopexit:                     ; preds = %.preheader13.us.us.new
  br label %._crit_edge22.us.us

._crit_edge22.us.us:                              ; preds = %._crit_edge22.us.us.loopexit, %.prol.loopexit45
  %indvars.iv.next9.us.us = add nuw nsw i64 %indvars.iv823.us.us, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next9.us.us, %7
  br i1 %exitcond48, label %._crit_edge25.us.loopexit, label %.preheader13.us.us

.preheader13.us.us.new:                           ; preds = %.preheader13.us.us.new, %.preheader13.us.us.new.preheader
  %indvars.iv620.us.us = phi i64 [ %indvars.iv.next7.us.us.1, %.preheader13.us.us.new ], [ %indvars.iv620.us.us.unr.ph, %.preheader13.us.us.new.preheader ]
  %20 = add nuw nsw i64 %indvars.iv620.us.us, %14
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, %2
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, %11
  %25 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1026.us, i64 %indvars.iv823.us.us, i64 %indvars.iv620.us.us
  store double %24, double* %25, align 8
  %indvars.iv.next7.us.us = add nuw nsw i64 %indvars.iv620.us.us, 1
  %26 = add nuw nsw i64 %indvars.iv.next7.us.us, %14
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, %2
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, %11
  %31 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1026.us, i64 %indvars.iv823.us.us, i64 %indvars.iv.next7.us.us
  store double %30, double* %31, align 8
  %indvars.iv.next7.us.us.1 = add nuw nsw i64 %indvars.iv620.us.us, 2
  %exitcond43.1 = icmp eq i64 %indvars.iv.next7.us.us.1, %6
  br i1 %exitcond43.1, label %._crit_edge22.us.us.loopexit, label %.preheader13.us.us.new

.preheader12.loopexit:                            ; preds = %._crit_edge25.us
  br label %.preheader12

.preheader12:                                     ; preds = %.preheader12.loopexit, %.preheader14.lr.ph, %5
  %32 = icmp sgt i32 %2, 0
  br i1 %32, label %.preheader.preheader, label %._crit_edge19

.preheader.preheader:                             ; preds = %.preheader12
  %wide.trip.count = zext i32 %2 to i64
  %33 = sitofp i32 %2 to double
  %xtraiter = and i64 %wide.trip.count, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %34 = icmp eq i32 %2, 1
  %35 = fdiv double 0.000000e+00, %33
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv417 = phi i64 [ %indvars.iv.next5, %._crit_edge ], [ 0, %.preheader.preheader ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader
  %36 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv417, i64 0
  store double %35, double* %36, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader
  %indvars.iv16.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader ]
  br i1 %34, label %._crit_edge, label %.preheader.new.preheader

.preheader.new.preheader:                         ; preds = %.prol.loopexit
  br label %.preheader.new

.preheader.new:                                   ; preds = %.preheader.new, %.preheader.new.preheader
  %indvars.iv16 = phi i64 [ %indvars.iv.next.1, %.preheader.new ], [ %indvars.iv16.unr.ph, %.preheader.new.preheader ]
  %37 = mul nuw nsw i64 %indvars.iv16, %indvars.iv417
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, %2
  %40 = sitofp i32 %39 to double
  %41 = fdiv double %40, %33
  %42 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv417, i64 %indvars.iv16
  store double %41, double* %42, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv16, 1
  %43 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv417
  %44 = trunc i64 %43 to i32
  %45 = srem i32 %44, %2
  %46 = sitofp i32 %45 to double
  %47 = fdiv double %46, %33
  %48 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv417, i64 %indvars.iv.next
  store double %47, double* %48, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv16, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.preheader.new

._crit_edge.loopexit:                             ; preds = %.preheader.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv417, 1
  %exitcond = icmp eq i64 %indvars.iv.next5, %6
  br i1 %exitcond, label %._crit_edge19.loopexit, label %.preheader

._crit_edge19.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit, %.preheader12
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, i32, [140 x [160 x double]]* nocapture readonly) unnamed_addr #1 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = sext i32 %2 to i64
  %10 = sext i32 %1 to i64
  %11 = sext i32 %0 to i64
  %12 = icmp sgt i32 %0, 0
  %13 = icmp sgt i32 %1, 0
  %or.cond = and i1 %12, %13
  br i1 %or.cond, label %.preheader7.us.preheader, label %._crit_edge15

.preheader7.us.preheader:                         ; preds = %4
  %14 = icmp sgt i32 %2, 0
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge11.us, %.preheader7.us.preheader
  %indvars.iv512.us = phi i64 [ %indvars.iv.next6.us, %._crit_edge11.us ], [ 0, %.preheader7.us.preheader ]
  %15 = mul nsw i64 %indvars.iv512.us, %10
  br i1 %14, label %.preheader.us.us.preheader, label %._crit_edge11.us

.preheader.us.us.preheader:                       ; preds = %.preheader7.us
  br label %.preheader.us.us

._crit_edge11.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.loopexit, %.preheader7.us
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv512.us, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next6.us, %11
  br i1 %exitcond30, label %._crit_edge15.loopexit, label %.preheader7.us

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv39.us.us = phi i64 [ %indvars.iv.next4.us.us, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %16 = add nsw i64 %indvars.iv39.us.us, %15
  %17 = mul i64 %16, %9
  br label %18

._crit_edge.us.us:                                ; preds = %25
  %indvars.iv.next4.us.us = add nuw nsw i64 %indvars.iv39.us.us, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next4.us.us, %10
  br i1 %exitcond29, label %._crit_edge11.us.loopexit, label %.preheader.us.us

; <label>:18:                                     ; preds = %25, %.preheader.us.us
  %indvars.iv8.us.us = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next.us.us, %25 ]
  %19 = add nsw i64 %indvars.iv8.us.us, %17
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 20
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %25

; <label>:23:                                     ; preds = %18
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %24) #6
  br label %25

; <label>:25:                                     ; preds = %23, %18
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv512.us, i64 %indvars.iv39.us.us, i64 %indvars.iv8.us.us
  %28 = load double, double* %27, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %28) #6
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv8.us.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us.us, %9
  br i1 %exitcond, label %._crit_edge.us.us, label %18

._crit_edge15.loopexit:                           ; preds = %._crit_edge11.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %4
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %32) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
