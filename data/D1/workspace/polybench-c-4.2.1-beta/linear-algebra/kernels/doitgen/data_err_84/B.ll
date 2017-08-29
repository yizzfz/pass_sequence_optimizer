; ModuleID = 'A.ll'
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

; Function Attrs: noinline nounwind uwtable
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture readonly, double*) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader2.lr.ph, label %._crit_edge18

.preheader2.lr.ph:                                ; preds = %6
  %8 = zext i32 %2 to i64
  %9 = add nsw i64 %8, -1
  %10 = shl nuw nsw i64 %8, 3
  %xtraiter48 = and i64 %8, 1
  %wide.trip.count35 = zext i32 %2 to i64
  %wide.trip.count31.1 = zext i32 %2 to i64
  %xtraiter54 = and i64 %8, 3
  %wide.trip.count39.3 = zext i32 %2 to i64
  %wide.trip.count43 = zext i32 %1 to i64
  %xtraiter = and i64 %8, 3
  %wide.trip.count.3 = zext i32 %2 to i64
  %wide.trip.count23 = zext i32 %1 to i64
  br label %.preheader2

.preheader2:                                      ; preds = %._crit_edge9, %.preheader2.lr.ph
  %11 = phi i32 [ 0, %.preheader2.lr.ph ], [ %99, %._crit_edge9 ]
  %12 = icmp sgt i32 %1, 0
  br i1 %12, label %.preheader1.lr.ph, label %._crit_edge9

.preheader1.lr.ph:                                ; preds = %.preheader2
  %13 = icmp sgt i32 %2, 0
  %14 = sext i32 %11 to i64
  br i1 %13, label %.preheader1.us.preheader, label %.preheader1.lr.ph..preheader1_crit_edge

.preheader1.us.preheader:                         ; preds = %.preheader1.lr.ph
  br label %.preheader1.us

.preheader1.lr.ph..preheader1_crit_edge:          ; preds = %.preheader1.lr.ph
  %15 = sext i32 %11 to i64
  br label %.preheader1

.preheader1.us:                                   ; preds = %._crit_edge8.us, %.preheader1.us.preheader
  %indvars.iv41 = phi i64 [ 0, %.preheader1.us.preheader ], [ %indvars.iv.next42, %._crit_edge8.us ]
  %16 = phi i32 [ %11, %.preheader1.us.preheader ], [ %split6.us, %._crit_edge8.us ]
  %17 = icmp sgt i32 %2, 0
  br i1 %17, label %.preheader1.us..lr.ph.us.us_crit_edge, label %..preheader_crit_edge.us.loopexit19

.preheader1.us..lr.ph.us.us_crit_edge:            ; preds = %.preheader1.us
  %18 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %14, i64 %indvars.iv41, i64 0
  br label %.lr.ph.us.us

._crit_edge8.us.loopexit:                         ; preds = %.lr.ph7.us.new
  br label %._crit_edge8.us

._crit_edge8.us:                                  ; preds = %._crit_edge8.us.loopexit, %.prol.loopexit53, %..preheader_crit_edge.us
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, %wide.trip.count43
  br i1 %exitcond44, label %._crit_edge9.loopexit, label %.preheader1.us

.lr.ph7.us.new:                                   ; preds = %.lr.ph7.us.new, %.lr.ph7.us.new.preheader
  %indvars.iv37 = phi i64 [ %indvars.iv37.unr, %.lr.ph7.us.new.preheader ], [ %indvars.iv.next38.3, %.lr.ph7.us.new ]
  %19 = getelementptr inbounds double, double* %5, i64 %indvars.iv37
  %20 = bitcast double* %19 to i64*
  %21 = load i64, i64* %20, align 8
  %22 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %64, i64 %indvars.iv41, i64 %indvars.iv37
  %23 = bitcast double* %22 to i64*
  store i64 %21, i64* %23, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %24 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next38
  %25 = bitcast double* %24 to i64*
  %26 = load i64, i64* %25, align 8
  %27 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %64, i64 %indvars.iv41, i64 %indvars.iv.next38
  %28 = bitcast double* %27 to i64*
  store i64 %26, i64* %28, align 8
  %indvars.iv.next38.1 = add nsw i64 %indvars.iv37, 2
  %29 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next38.1
  %30 = bitcast double* %29 to i64*
  %31 = load i64, i64* %30, align 8
  %32 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %64, i64 %indvars.iv41, i64 %indvars.iv.next38.1
  %33 = bitcast double* %32 to i64*
  store i64 %31, i64* %33, align 8
  %indvars.iv.next38.2 = add nsw i64 %indvars.iv37, 3
  %34 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next38.2
  %35 = bitcast double* %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %64, i64 %indvars.iv41, i64 %indvars.iv.next38.2
  %38 = bitcast double* %37 to i64*
  store i64 %36, i64* %38, align 8
  %indvars.iv.next38.3 = add nuw nsw i64 %indvars.iv37, 4
  %exitcond40.3 = icmp eq i64 %indvars.iv.next38.3, %wide.trip.count39.3
  br i1 %exitcond40.3, label %._crit_edge8.us.loopexit, label %.lr.ph7.us.new

..preheader_crit_edge.us.loopexit19:              ; preds = %.preheader1.us
  %39 = bitcast double* %5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %39, i8 0, i64 %10, i32 8, i1 false)
  br label %..preheader_crit_edge.us

..preheader_crit_edge.us.loopexit:                ; preds = %._crit_edge.us.us
  br label %..preheader_crit_edge.us

..preheader_crit_edge.us:                         ; preds = %..preheader_crit_edge.us.loopexit, %..preheader_crit_edge.us.loopexit19
  %split6.us = phi i32 [ %16, %..preheader_crit_edge.us.loopexit19 ], [ %11, %..preheader_crit_edge.us.loopexit ]
  %40 = icmp sgt i32 %2, 0
  br i1 %40, label %.lr.ph7.us, label %._crit_edge8.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.preheader1.us..lr.ph.us.us_crit_edge
  %indvars.iv33 = phi i64 [ 0, %.preheader1.us..lr.ph.us.us_crit_edge ], [ %indvars.iv.next34, %._crit_edge.us.us ]
  %41 = icmp eq i64 %xtraiter48, 0
  %42 = getelementptr inbounds double, double* %5, i64 %indvars.iv33
  store double 0.000000e+00, double* %42, align 8
  br i1 %41, label %.prol.loopexit47, label %.prol.preheader46

.prol.preheader46:                                ; preds = %.lr.ph.us.us
  %43 = ptrtoint double* %5 to i64
  %44 = load double, double* %18, align 8
  %45 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv33
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fadd double %47, 0.000000e+00
  %sunkaddr58 = shl i64 %indvars.iv33, 3
  %sunkaddr59 = add i64 %43, %sunkaddr58
  %sunkaddr60 = inttoptr i64 %sunkaddr59 to double*
  store double %48, double* %sunkaddr60, align 8
  br label %.prol.loopexit47

.prol.loopexit47:                                 ; preds = %.lr.ph.us.us, %.prol.preheader46
  %indvars.iv29.unr.ph = phi i64 [ 1, %.prol.preheader46 ], [ 0, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %48, %.prol.preheader46 ], [ 0.000000e+00, %.lr.ph.us.us ]
  %49 = icmp eq i64 %9, 0
  br i1 %49, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit47
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit47
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, %wide.trip.count35
  br i1 %exitcond36, label %..preheader_crit_edge.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new, %.lr.ph.us.us.new.preheader
  %indvars.iv29 = phi i64 [ %indvars.iv29.unr.ph, %.lr.ph.us.us.new.preheader ], [ %indvars.iv.next30.1, %.lr.ph.us.us.new ]
  %50 = phi double [ %.unr.ph, %.lr.ph.us.us.new.preheader ], [ %62, %.lr.ph.us.us.new ]
  %51 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %14, i64 %indvars.iv41, i64 %indvars.iv29
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv29, i64 %indvars.iv33
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = fadd double %50, %55
  %sunkaddr = ptrtoint double* %5 to i64
  %sunkaddr66 = mul i64 %indvars.iv33, 8
  %sunkaddr67 = add i64 %sunkaddr, %sunkaddr66
  %sunkaddr68 = inttoptr i64 %sunkaddr67 to double*
  store double %56, double* %sunkaddr68, align 8
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %57 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %14, i64 %indvars.iv41, i64 %indvars.iv.next30
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next30, i64 %indvars.iv33
  %60 = load double, double* %59, align 8
  %61 = fmul double %58, %60
  %62 = fadd double %56, %61
  store double %62, double* %sunkaddr68, align 8
  %indvars.iv.next30.1 = add nuw nsw i64 %indvars.iv29, 2
  %exitcond32.1 = icmp eq i64 %indvars.iv.next30.1, %wide.trip.count31.1
  br i1 %exitcond32.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph7.us:                                       ; preds = %..preheader_crit_edge.us
  %63 = icmp eq i64 %xtraiter54, 0
  %64 = sext i32 %split6.us to i64
  br i1 %63, label %.prol.loopexit53, label %.prol.preheader52.preheader

.prol.preheader52.preheader:                      ; preds = %.lr.ph7.us
  br label %.prol.preheader52

.prol.preheader52:                                ; preds = %.prol.preheader52, %.prol.preheader52.preheader
  %indvars.iv37.prol = phi i64 [ 0, %.prol.preheader52.preheader ], [ %indvars.iv.next38.prol, %.prol.preheader52 ]
  %prol.iter56 = phi i64 [ %xtraiter54, %.prol.preheader52.preheader ], [ %prol.iter56.sub, %.prol.preheader52 ]
  %65 = getelementptr inbounds double, double* %5, i64 %indvars.iv37.prol
  %66 = bitcast double* %65 to i64*
  %67 = load i64, i64* %66, align 8
  %68 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %64, i64 %indvars.iv41, i64 %indvars.iv37.prol
  %69 = bitcast double* %68 to i64*
  store i64 %67, i64* %69, align 8
  %indvars.iv.next38.prol = add nuw nsw i64 %indvars.iv37.prol, 1
  %prol.iter56.sub = add nsw i64 %prol.iter56, -1
  %prol.iter56.cmp = icmp eq i64 %prol.iter56.sub, 0
  br i1 %prol.iter56.cmp, label %.prol.loopexit53.loopexit, label %.prol.preheader52, !llvm.loop !1

.prol.loopexit53.loopexit:                        ; preds = %.prol.preheader52
  br label %.prol.loopexit53

.prol.loopexit53:                                 ; preds = %.prol.loopexit53.loopexit, %.lr.ph7.us
  %indvars.iv37.unr = phi i64 [ 0, %.lr.ph7.us ], [ %xtraiter, %.prol.loopexit53.loopexit ]
  %70 = icmp ult i64 %9, 3
  br i1 %70, label %._crit_edge8.us, label %.lr.ph7.us.new.preheader

.lr.ph7.us.new.preheader:                         ; preds = %.prol.loopexit53
  br label %.lr.ph7.us.new

.preheader1:                                      ; preds = %._crit_edge8, %.preheader1.lr.ph..preheader1_crit_edge
  %indvars.iv21 = phi i64 [ 0, %.preheader1.lr.ph..preheader1_crit_edge ], [ %indvars.iv.next22, %._crit_edge8 ]
  %71 = icmp sgt i32 %2, 0
  br i1 %71, label %.lr.ph7, label %._crit_edge8

.lr.ph7:                                          ; preds = %.preheader1
  %72 = icmp eq i64 %xtraiter, 0
  br i1 %72, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph7
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader, %.prol.preheader.preheader
  %indvars.iv.prol = phi i64 [ 0, %.prol.preheader.preheader ], [ %indvars.iv.next.prol, %.prol.preheader ]
  %prol.iter = phi i64 [ %xtraiter, %.prol.preheader.preheader ], [ %prol.iter.sub, %.prol.preheader ]
  %73 = getelementptr inbounds double, double* %5, i64 %indvars.iv.prol
  %74 = bitcast double* %73 to i64*
  %75 = load i64, i64* %74, align 8
  %76 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %15, i64 %indvars.iv21, i64 %indvars.iv.prol
  %77 = bitcast double* %76 to i64*
  store i64 %75, i64* %77, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph7
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph7 ], [ %xtraiter, %.prol.loopexit.loopexit ]
  %78 = icmp ult i64 %9, 3
  br i1 %78, label %._crit_edge8, label %.lr.ph7.new.preheader

.lr.ph7.new.preheader:                            ; preds = %.prol.loopexit
  br label %.lr.ph7.new

.lr.ph7.new:                                      ; preds = %.lr.ph7.new, %.lr.ph7.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.unr, %.lr.ph7.new.preheader ], [ %indvars.iv.next.3, %.lr.ph7.new ]
  %79 = getelementptr inbounds double, double* %5, i64 %indvars.iv
  %80 = bitcast double* %79 to i64*
  %81 = load i64, i64* %80, align 8
  %82 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %15, i64 %indvars.iv21, i64 %indvars.iv
  %83 = bitcast double* %82 to i64*
  store i64 %81, i64* %83, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %84 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next
  %85 = bitcast double* %84 to i64*
  %86 = load i64, i64* %85, align 8
  %87 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %15, i64 %indvars.iv21, i64 %indvars.iv.next
  %88 = bitcast double* %87 to i64*
  store i64 %86, i64* %88, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %89 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next.1
  %90 = bitcast double* %89 to i64*
  %91 = load i64, i64* %90, align 8
  %92 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %15, i64 %indvars.iv21, i64 %indvars.iv.next.1
  %93 = bitcast double* %92 to i64*
  store i64 %91, i64* %93, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %94 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next.2
  %95 = bitcast double* %94 to i64*
  %96 = load i64, i64* %95, align 8
  %97 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %15, i64 %indvars.iv21, i64 %indvars.iv.next.2
  %98 = bitcast double* %97 to i64*
  store i64 %96, i64* %98, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge8.loopexit, label %.lr.ph7.new

._crit_edge8.loopexit:                            ; preds = %.lr.ph7.new
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %.prol.loopexit, %.preheader1
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next22, %wide.trip.count23
  br i1 %exitcond24, label %._crit_edge9.loopexit69, label %.preheader1

._crit_edge9.loopexit:                            ; preds = %._crit_edge8.us
  br label %._crit_edge9

._crit_edge9.loopexit69:                          ; preds = %._crit_edge8
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit69, %._crit_edge9.loopexit, %.preheader2
  %.lcssa4 = phi i32 [ %11, %.preheader2 ], [ %split6.us, %._crit_edge9.loopexit ], [ %11, %._crit_edge9.loopexit69 ]
  %99 = add nsw i32 %.lcssa4, 1
  %100 = icmp slt i32 %99, %0
  br i1 %100, label %.preheader2, label %._crit_edge18.loopexit

._crit_edge18.loopexit:                           ; preds = %._crit_edge9
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  tail call fastcc void @init_array([140 x [160 x double]]* %6, [160 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7, double* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %3 to [140 x [160 x double]]*
  tail call fastcc void @print_array([140 x [160 x double]]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([140 x [160 x double]]* nocapture, [160 x double]* nocapture) unnamed_addr #2 {
  br label %.preheader3

.preheader3:                                      ; preds = %18, %2
  %indvars.iv10 = phi i64 [ 0, %2 ], [ %indvars.iv.next11, %18 ]
  br label %.preheader2

.preheader2:                                      ; preds = %17, %.preheader3
  %indvars.iv7 = phi i64 [ 0, %.preheader3 ], [ %indvars.iv.next8, %17 ]
  %3 = mul nuw nsw i64 %indvars.iv7, %indvars.iv10
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader2
  %indvars.iv4 = phi i64 [ 0, %.preheader2 ], [ %indvars.iv.next5.1, %._crit_edge ]
  %4 = add nuw nsw i64 %indvars.iv4, %3
  %5 = trunc i64 %4 to i32
  %6 = srem i32 %5, 160
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv10, i64 %indvars.iv7, i64 %indvars.iv4
  %indvars.iv.next5 = or i64 %indvars.iv4, 1
  %9 = add nuw nsw i64 %indvars.iv.next5, %3
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 160
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %7, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fdiv <2 x double> %14, <double 1.600000e+02, double 1.600000e+02>
  %16 = bitcast double* %8 to <2 x double>*
  store <2 x double> %15, <2 x double>* %16, align 8
  %indvars.iv.next5.1 = add nuw nsw i64 %indvars.iv4, 2
  %exitcond6.1 = icmp eq i64 %indvars.iv.next5.1, 160
  br i1 %exitcond6.1, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 140
  br i1 %exitcond9, label %18, label %.preheader2

; <label>:18:                                     ; preds = %17
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 150
  br i1 %exitcond12, label %.preheader.preheader, label %.preheader3

.preheader.preheader:                             ; preds = %18
  br label %.preheader

.preheader:                                       ; preds = %32, %.preheader.preheader
  %indvars.iv1 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next2, %32 ]
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge13 ]
  %19 = mul nuw nsw i64 %indvars.iv, %indvars.iv1
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 160
  %22 = sitofp i32 %21 to double
  %23 = getelementptr inbounds [160 x double], [160 x double]* %1, i64 %indvars.iv1, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %24 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv1
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 160
  %27 = sitofp i32 %26 to double
  %28 = insertelement <2 x double> undef, double %22, i32 0
  %29 = insertelement <2 x double> %28, double %27, i32 1
  %30 = fdiv <2 x double> %29, <double 1.600000e+02, double 1.600000e+02>
  %31 = bitcast double* %23 to <2 x double>*
  store <2 x double> %30, <2 x double>* %31, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %32, label %._crit_edge13

; <label>:32:                                     ; preds = %._crit_edge13
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 160
  br i1 %exitcond3, label %33, label %.preheader

; <label>:33:                                     ; preds = %32
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([140 x [160 x double]]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader1

.preheader1:                                      ; preds = %20, %1
  %indvars.iv4 = phi i64 [ 0, %1 ], [ %indvars.iv.next5, %20 ]
  %6 = mul nuw nsw i64 %indvars.iv4, 140
  br label %.preheader

.preheader:                                       ; preds = %19, %.preheader1
  %indvars.iv1 = phi i64 [ 0, %.preheader1 ], [ %indvars.iv.next2, %19 ]
  %7 = add nuw nsw i64 %indvars.iv1, %6
  %8 = mul nuw nsw i64 %7, 160
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %9 = add nuw nsw i64 %indvars.iv, %8
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %._crit_edge._crit_edge
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge._crit_edge, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv1, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %19, label %._crit_edge._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 140
  br i1 %exitcond3, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 150
  br i1 %exitcond6, label %21, label %.preheader1

; <label>:21:                                     ; preds = %20
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #6
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
