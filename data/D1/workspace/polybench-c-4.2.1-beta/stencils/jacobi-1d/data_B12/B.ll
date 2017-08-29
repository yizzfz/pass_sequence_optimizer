; ModuleID = 'A.ll'
source_filename = "jacobi-1d.c"
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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = bitcast i8* %3 to double*
  %6 = bitcast i8* %4 to double*
  tail call fastcc void @init_array(i32 2000, double* %5, double* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_jacobi_1d(i32 500, i32 2000, double* %5, double* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %13

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %8
  %12 = bitcast i8* %3 to double*
  tail call fastcc void @print_array(i32 2000, double* %12)
  br label %13

; <label>:13:                                     ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture, double* nocapture) unnamed_addr #2 {
  %4 = sext i32 %0 to i64
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %3
  %6 = sitofp i32 %0 to double
  %7 = insertelement <2 x double> undef, double %6, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  %xtraiter = and i64 %4, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %9

; <label>:9:                                      ; preds = %.lr.ph
  %10 = fdiv <2 x double> <double 2.000000e+00, double 3.000000e+00>, %8
  %11 = extractelement <2 x double> %10, i32 0
  %12 = extractelement <2 x double> %10, i32 1
  store double %11, double* %1, align 8
  store double %12, double* %2, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %9
  %indvars.iv1.unr = phi i64 [ 1, %9 ], [ 0, %.lr.ph ]
  %13 = icmp eq i32 %0, 1
  br i1 %13, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv1 = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv1.unr, %.lr.ph.new.preheader ]
  %14 = trunc i64 %indvars.iv1 to i32
  %15 = sitofp i32 %14 to double
  %16 = getelementptr inbounds double, double* %1, i64 %indvars.iv1
  %17 = insertelement <2 x double> undef, double %15, i32 0
  %18 = shufflevector <2 x double> %17, <2 x double> undef, <2 x i32> zeroinitializer
  %19 = fadd <2 x double> %18, <double 2.000000e+00, double 3.000000e+00>
  %20 = fdiv <2 x double> %19, %8
  %21 = extractelement <2 x double> %20, i32 0
  %22 = extractelement <2 x double> %20, i32 1
  store double %21, double* %16, align 8
  %23 = getelementptr inbounds double, double* %2, i64 %indvars.iv1
  store double %22, double* %23, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %24 = trunc i64 %indvars.iv.next to i32
  %25 = sitofp i32 %24 to double
  %26 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  %27 = insertelement <2 x double> undef, double %25, i32 0
  %28 = shufflevector <2 x double> %27, <2 x double> undef, <2 x i32> zeroinitializer
  %29 = fadd <2 x double> %28, <double 2.000000e+00, double 3.000000e+00>
  %30 = fdiv <2 x double> %29, %8
  %31 = extractelement <2 x double> %30, i32 0
  %32 = extractelement <2 x double> %30, i32 1
  store double %31, double* %26, align 8
  %33 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  store double %32, double* %33, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv1, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %4
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32, i32, double* nocapture, double* nocapture) unnamed_addr #2 {
  %5 = add i32 %1, -1
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader2.preheader.lr.ph, label %._crit_edge

.preheader2.preheader.lr.ph:                      ; preds = %4
  %7 = add nsw i32 %1, -1
  %8 = sext i32 %7 to i64
  %9 = icmp sgt i32 %7, 1
  br i1 %9, label %.preheader2.preheader.us.preheader, label %.preheader2.preheader.lr.ph.split

.preheader2.preheader.us.preheader:               ; preds = %.preheader2.preheader.lr.ph
  %10 = add nsw i64 %8, -1
  %11 = add nsw i64 %8, -2
  %xtraiter = and i64 %10, 1
  %xtraiter29 = and i64 %10, 1
  %12 = icmp eq i64 %xtraiter, 0
  %13 = icmp eq i64 %11, 0
  %14 = icmp sgt i32 %5, 1
  %15 = icmp eq i64 %xtraiter29, 0
  %16 = icmp eq i64 %11, 0
  %sunkaddr45 = ptrtoint double* %3 to i64
  %sunkaddr46 = add i64 %sunkaddr45, 8
  %sunkaddr47 = inttoptr i64 %sunkaddr46 to double*
  %sunkaddr48 = ptrtoint double* %3 to i64
  %sunkaddr49 = add i64 %sunkaddr48, 16
  %sunkaddr50 = inttoptr i64 %sunkaddr49 to double*
  %sunkaddr51 = ptrtoint double* %2 to i64
  %sunkaddr52 = add i64 %sunkaddr51, 8
  %sunkaddr53 = inttoptr i64 %sunkaddr52 to double*
  %sunkaddr = ptrtoint double* %2 to i64
  %sunkaddr37 = add i64 %sunkaddr, 8
  %sunkaddr38 = inttoptr i64 %sunkaddr37 to double*
  %sunkaddr39 = ptrtoint double* %2 to i64
  %sunkaddr40 = add i64 %sunkaddr39, 16
  %sunkaddr41 = inttoptr i64 %sunkaddr40 to double*
  %sunkaddr42 = ptrtoint double* %3 to i64
  %sunkaddr43 = add i64 %sunkaddr42, 8
  %sunkaddr44 = inttoptr i64 %sunkaddr43 to double*
  br label %.preheader2.preheader.us

.preheader2.preheader.us:                         ; preds = %.preheader._crit_edge.us, %.preheader2.preheader.us.preheader
  %.018.us = phi i32 [ 0, %.preheader2.preheader.us.preheader ], [ %23, %.preheader._crit_edge.us ]
  br i1 %12, label %.preheader2.us.prol.loopexit, label %.preheader2.us.prol

.preheader2.us.prol:                              ; preds = %.preheader2.preheader.us
  %17 = load double, double* %2, align 8
  %18 = load double, double* %sunkaddr38, align 8
  %19 = fadd double %17, %18
  %20 = load double, double* %sunkaddr41, align 8
  %21 = fadd double %19, %20
  %22 = fmul double %21, 3.333300e-01
  store double %22, double* %sunkaddr44, align 8
  br label %.preheader2.us.prol.loopexit

.preheader2.us.prol.loopexit:                     ; preds = %.preheader2.preheader.us, %.preheader2.us.prol
  %indvars.iv5.us.unr.ph = phi i64 [ 2, %.preheader2.us.prol ], [ 1, %.preheader2.preheader.us ]
  br i1 %13, label %.preheader2..preheader.preheader_crit_edge.us, label %.preheader2.us.preheader

.preheader2.us.preheader:                         ; preds = %.preheader2.us.prol.loopexit
  br label %.preheader2.us

.preheader._crit_edge.us.loopexit:                ; preds = %.preheader.us
  br label %.preheader._crit_edge.us

.preheader._crit_edge.us:                         ; preds = %.preheader._crit_edge.us.loopexit, %.preheader.us.prol.loopexit, %.preheader2..preheader.preheader_crit_edge.us
  %23 = add nuw nsw i32 %.018.us, 1
  %exitcond25 = icmp eq i32 %23, %0
  br i1 %exitcond25, label %._crit_edge.loopexit, label %.preheader2.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader64, %.preheader.us
  %indvars.iv36.us = phi i64 [ %indvars.iv.next4.us.1, %.preheader.us ], [ %indvars.iv36.us.unr.ph, %.preheader.us.preheader64 ]
  %24 = add nsw i64 %indvars.iv36.us, -1
  %25 = getelementptr inbounds double, double* %3, i64 %24
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds double, double* %3, i64 %indvars.iv36.us
  %28 = load double, double* %27, align 8
  %29 = fadd double %26, %28
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv36.us, 1
  %30 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next4.us
  %31 = load double, double* %30, align 8
  %32 = fadd double %29, %31
  %33 = fmul double %32, 3.333300e-01
  %34 = getelementptr inbounds double, double* %2, i64 %indvars.iv36.us
  store double %33, double* %34, align 8
  %35 = getelementptr inbounds double, double* %3, i64 %indvars.iv36.us
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next4.us
  %38 = load double, double* %37, align 8
  %39 = fadd double %36, %38
  %indvars.iv.next4.us.1 = add nsw i64 %indvars.iv36.us, 2
  %40 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next4.us.1
  %41 = load double, double* %40, align 8
  %42 = fadd double %39, %41
  %43 = fmul double %42, 3.333300e-01
  %44 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next4.us
  store double %43, double* %44, align 8
  %exitcond24.1 = icmp eq i64 %indvars.iv.next4.us.1, %8
  br i1 %exitcond24.1, label %.preheader._crit_edge.us.loopexit, label %.preheader.us

.preheader2.us:                                   ; preds = %.preheader2.us.preheader, %.preheader2.us
  %indvars.iv5.us = phi i64 [ %indvars.iv.next.us.1, %.preheader2.us ], [ %indvars.iv5.us.unr.ph, %.preheader2.us.preheader ]
  %45 = add nsw i64 %indvars.iv5.us, -1
  %46 = getelementptr inbounds double, double* %2, i64 %45
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds double, double* %2, i64 %indvars.iv5.us
  %49 = load double, double* %48, align 8
  %50 = fadd double %47, %49
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv5.us, 1
  %51 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.us
  %52 = load double, double* %51, align 8
  %53 = fadd double %50, %52
  %54 = fmul double %53, 3.333300e-01
  %55 = getelementptr inbounds double, double* %3, i64 %indvars.iv5.us
  store double %54, double* %55, align 8
  %56 = getelementptr inbounds double, double* %2, i64 %indvars.iv5.us
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.us
  %59 = load double, double* %58, align 8
  %60 = fadd double %57, %59
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv5.us, 2
  %61 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.us.1
  %62 = load double, double* %61, align 8
  %63 = fadd double %60, %62
  %64 = fmul double %63, 3.333300e-01
  %65 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next.us
  store double %64, double* %65, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.1, %8
  br i1 %exitcond.1, label %.preheader2..preheader.preheader_crit_edge.us.loopexit, label %.preheader2.us

.preheader2..preheader.preheader_crit_edge.us.loopexit: ; preds = %.preheader2.us
  br label %.preheader2..preheader.preheader_crit_edge.us

.preheader2..preheader.preheader_crit_edge.us:    ; preds = %.preheader2..preheader.preheader_crit_edge.us.loopexit, %.preheader2.us.prol.loopexit
  br i1 %14, label %.preheader.us.preheader, label %.preheader._crit_edge.us

.preheader.us.preheader:                          ; preds = %.preheader2..preheader.preheader_crit_edge.us
  br i1 %15, label %.preheader.us.prol.loopexit, label %.preheader.us.prol

.preheader.us.prol:                               ; preds = %.preheader.us.preheader
  %66 = load double, double* %3, align 8
  %67 = load double, double* %sunkaddr47, align 8
  %68 = fadd double %66, %67
  %69 = load double, double* %sunkaddr50, align 8
  %70 = fadd double %68, %69
  %71 = fmul double %70, 3.333300e-01
  store double %71, double* %sunkaddr53, align 8
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.us.preheader, %.preheader.us.prol
  %indvars.iv36.us.unr.ph = phi i64 [ 2, %.preheader.us.prol ], [ 1, %.preheader.us.preheader ]
  br i1 %16, label %.preheader._crit_edge.us, label %.preheader.us.preheader64

.preheader.us.preheader64:                        ; preds = %.preheader.us.prol.loopexit
  br label %.preheader.us

.preheader2.preheader.lr.ph.split:                ; preds = %.preheader2.preheader.lr.ph
  %72 = icmp sgt i32 %5, 1
  br i1 %72, label %.preheader2.preheader.us9.preheader, label %._crit_edge

.preheader2.preheader.us9.preheader:              ; preds = %.preheader2.preheader.lr.ph.split
  %73 = and i64 %8, 1
  %74 = icmp eq i64 %73, 0
  %sunkaddr54 = ptrtoint double* %3 to i64
  %sunkaddr55 = add i64 %sunkaddr54, 8
  %sunkaddr56 = inttoptr i64 %sunkaddr55 to double*
  %sunkaddr57 = ptrtoint double* %3 to i64
  %sunkaddr58 = add i64 %sunkaddr57, 16
  %sunkaddr59 = inttoptr i64 %sunkaddr58 to double*
  %sunkaddr60 = ptrtoint double* %2 to i64
  %sunkaddr61 = add i64 %sunkaddr60, 8
  %sunkaddr62 = inttoptr i64 %sunkaddr61 to double*
  %75 = icmp eq i32 %7, 2
  br label %.preheader2.preheader.us9

.preheader2.preheader.us9:                        ; preds = %.preheader._crit_edge.us21, %.preheader2.preheader.us9.preheader
  %.018.us10 = phi i32 [ 0, %.preheader2.preheader.us9.preheader ], [ %103, %.preheader._crit_edge.us21 ]
  br i1 %74, label %.preheader.us12.prol, label %.preheader.us12.prol.loopexit

.preheader.us12.prol:                             ; preds = %.preheader2.preheader.us9
  %76 = load double, double* %3, align 8
  %77 = load double, double* %sunkaddr56, align 8
  %78 = fadd double %76, %77
  %79 = load double, double* %sunkaddr59, align 8
  %80 = fadd double %78, %79
  %81 = fmul double %80, 3.333300e-01
  store double %81, double* %sunkaddr62, align 8
  br label %.preheader.us12.prol.loopexit

.preheader.us12.prol.loopexit:                    ; preds = %.preheader2.preheader.us9, %.preheader.us12.prol
  %indvars.iv36.us13.unr.ph = phi i64 [ 2, %.preheader.us12.prol ], [ 1, %.preheader2.preheader.us9 ]
  br i1 %75, label %.preheader._crit_edge.us21, label %.preheader.us12.preheader

.preheader.us12.preheader:                        ; preds = %.preheader.us12.prol.loopexit
  br label %.preheader.us12

.preheader.us12:                                  ; preds = %.preheader.us12.preheader, %.preheader.us12
  %indvars.iv36.us13 = phi i64 [ %indvars.iv.next4.us14.1, %.preheader.us12 ], [ %indvars.iv36.us13.unr.ph, %.preheader.us12.preheader ]
  %82 = add nsw i64 %indvars.iv36.us13, -1
  %83 = getelementptr inbounds double, double* %3, i64 %82
  %84 = load double, double* %83, align 8
  %85 = getelementptr inbounds double, double* %3, i64 %indvars.iv36.us13
  %86 = load double, double* %85, align 8
  %87 = fadd double %84, %86
  %indvars.iv.next4.us14 = add nuw nsw i64 %indvars.iv36.us13, 1
  %88 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next4.us14
  %89 = load double, double* %88, align 8
  %90 = fadd double %87, %89
  %91 = fmul double %90, 3.333300e-01
  %92 = getelementptr inbounds double, double* %2, i64 %indvars.iv36.us13
  store double %91, double* %92, align 8
  %93 = getelementptr inbounds double, double* %3, i64 %indvars.iv36.us13
  %94 = load double, double* %93, align 8
  %95 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next4.us14
  %96 = load double, double* %95, align 8
  %97 = fadd double %94, %96
  %indvars.iv.next4.us14.1 = add nsw i64 %indvars.iv36.us13, 2
  %98 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next4.us14.1
  %99 = load double, double* %98, align 8
  %100 = fadd double %97, %99
  %101 = fmul double %100, 3.333300e-01
  %102 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next4.us14
  store double %101, double* %102, align 8
  %exitcond26.1 = icmp eq i64 %indvars.iv.next4.us14.1, %8
  br i1 %exitcond26.1, label %.preheader._crit_edge.us21.loopexit, label %.preheader.us12

.preheader._crit_edge.us21.loopexit:              ; preds = %.preheader.us12
  br label %.preheader._crit_edge.us21

.preheader._crit_edge.us21:                       ; preds = %.preheader._crit_edge.us21.loopexit, %.preheader.us12.prol.loopexit
  %103 = add nuw nsw i32 %.018.us10, 1
  %exitcond27 = icmp eq i32 %103, %0
  br i1 %exitcond27, label %._crit_edge.loopexit65, label %.preheader2.preheader.us9

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge.us
  br label %._crit_edge

._crit_edge.loopexit65:                           ; preds = %.preheader._crit_edge.us21
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit65, %._crit_edge.loopexit, %.preheader2.preheader.lr.ph.split, %4
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = sext i32 %0 to i64
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %14
  %indvars.iv1 = phi i64 [ %indvars.iv.next, %14 ], [ 0, %.lr.ph.preheader ]
  %9 = trunc i64 %indvars.iv1 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %.lr.ph
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %.lr.ph, %12
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds double, double* %1, i64 %indvars.iv1
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %7
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %14
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
