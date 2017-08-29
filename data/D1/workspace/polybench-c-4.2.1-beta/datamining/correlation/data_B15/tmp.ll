; ModuleID = 'A.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %8 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(i32 1200, i32 1400, double* nonnull %3, [1200 x double]* %8)
  call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  call fastcc void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  call fastcc void @print_array(i32 1200, [1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1200 x double]*) unnamed_addr #2 {
  store double 1.400000e+03, double* %2, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %22, %4
  %indvars.iv6 = phi i64 [ 0, %4 ], [ %indvars.iv.next7, %22 ]
  %5 = trunc i64 %indvars.iv6 to i32
  %6 = sitofp i32 %5 to double
  %7 = insertelement <2 x double> undef, double %6, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  br label %9

; <label>:9:                                      ; preds = %9, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %9 ]
  %10 = mul nuw nsw i64 %indvars.iv6, %indvars.iv
  %11 = trunc i64 %10 to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv6, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = mul nuw nsw i64 %indvars.iv6, %indvars.iv.next
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = insertelement <2 x double> undef, double %12, i32 0
  %18 = insertelement <2 x double> %17, double %16, i32 1
  %19 = fdiv <2 x double> %18, <double 1.200000e+03, double 1.200000e+03>
  %20 = fadd <2 x double> %8, %19
  %21 = bitcast double* %13 to <2 x double>*
  store <2 x double> %20, <2 x double>* %21, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %22, label %9

; <label>:22:                                     ; preds = %9
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 1400
  br i1 %exitcond8, label %23, label %._crit_edge

; <label>:23:                                     ; preds = %22
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]*, [1200 x double]*, double*, double*) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph65, label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %7
  br label %._crit_edge9

.lr.ph65:                                         ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sext i32 %0 to i64
  br i1 %9, label %.lr.ph65.split.us.preheader, label %.lr.ph65.split.preheader

.lr.ph65.split.preheader:                         ; preds = %.lr.ph65
  %xtraiter186 = and i64 %10, 1
  %lcmp.mod187 = icmp eq i64 %xtraiter186, 0
  br i1 %lcmp.mod187, label %.lr.ph65.split.prol.loopexit, label %.lr.ph65.split.prol.preheader

.lr.ph65.split.prol.preheader:                    ; preds = %.lr.ph65.split.preheader
  br label %.lr.ph65.split.prol

.lr.ph65.split.prol:                              ; preds = %.lr.ph65.split.prol.preheader
  %11 = fdiv double 0.000000e+00, %2
  store double %11, double* %5, align 8
  br label %.lr.ph65.split.prol.loopexit

.lr.ph65.split.prol.loopexit:                     ; preds = %.lr.ph65.split.preheader, %.lr.ph65.split.prol
  %indvars.iv149.unr = phi i64 [ 0, %.lr.ph65.split.preheader ], [ 1, %.lr.ph65.split.prol ]
  %storemerge63.unr = phi i64 [ 0, %.lr.ph65.split.preheader ], [ 1, %.lr.ph65.split.prol ]
  %12 = icmp eq i32 %0, 1
  br i1 %12, label %._crit_edge.loopexit178, label %.lr.ph65.split.preheader.new

.lr.ph65.split.preheader.new:                     ; preds = %.lr.ph65.split.prol.loopexit
  br label %.lr.ph65.split

.lr.ph65.split.us.preheader:                      ; preds = %.lr.ph65
  %13 = add i32 %1, -1
  %xtraiter158 = and i32 %1, 3
  %lcmp.mod159 = icmp eq i32 %xtraiter158, 0
  %14 = icmp ult i32 %13, 3
  %wide.trip.count144.3 = zext i32 %1 to i64
  br label %.lr.ph65.split.us

.lr.ph65.split.us:                                ; preds = %.lr.ph65.split.us.preheader, %._crit_edge60.us
  %indvars.iv146 = phi i64 [ 0, %.lr.ph65.split.us.preheader ], [ %indvars.iv.next147, %._crit_edge60.us ]
  %storemerge63.us = phi i64 [ 0, %.lr.ph65.split.us.preheader ], [ %indvars.iv.next147, %._crit_edge60.us ]
  %sext164 = shl i64 %storemerge63.us, 32
  %15 = ashr exact i64 %sext164, 32
  %16 = getelementptr inbounds double, double* %5, i64 %15
  store double 0.000000e+00, double* %16, align 8
  %17 = getelementptr inbounds double, double* %5, i64 %indvars.iv146
  br i1 %lcmp.mod159, label %.prol.loopexit157, label %.lr.ph65.split.us..prol.preheader156_crit_edge

.lr.ph65.split.us..prol.preheader156_crit_edge:   ; preds = %.lr.ph65.split.us
  %.pre = load double, double* %17, align 8
  br label %.prol.preheader156

.prol.preheader156:                               ; preds = %.lr.ph65.split.us..prol.preheader156_crit_edge, %.prol.preheader156
  %18 = phi double [ %21, %.prol.preheader156 ], [ %.pre, %.lr.ph65.split.us..prol.preheader156_crit_edge ]
  %indvars.iv142.prol = phi i64 [ %indvars.iv.next143.prol, %.prol.preheader156 ], [ 0, %.lr.ph65.split.us..prol.preheader156_crit_edge ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader156 ], [ %xtraiter158, %.lr.ph65.split.us..prol.preheader156_crit_edge ]
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv142.prol, i64 %indvars.iv146
  %20 = load double, double* %19, align 8
  %21 = fadd double %20, %18
  store double %21, double* %17, align 8
  %indvars.iv.next143.prol = add nuw nsw i64 %indvars.iv142.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit157.loopexit, label %.prol.preheader156, !llvm.loop !1

.prol.loopexit157.loopexit:                       ; preds = %.prol.preheader156
  br label %.prol.loopexit157

.prol.loopexit157:                                ; preds = %.prol.loopexit157.loopexit, %.lr.ph65.split.us
  %indvars.iv142.unr = phi i64 [ 0, %.lr.ph65.split.us ], [ %indvars.iv.next143.prol, %.prol.loopexit157.loopexit ]
  br i1 %14, label %.prol.loopexit157.._crit_edge60.us_crit_edge, label %.prol.loopexit157..lr.ph65.split.us.new_crit_edge

.prol.loopexit157.._crit_edge60.us_crit_edge:     ; preds = %.prol.loopexit157
  %.pre174 = load double, double* %17, align 8
  br label %._crit_edge60.us

.prol.loopexit157..lr.ph65.split.us.new_crit_edge: ; preds = %.prol.loopexit157
  %.pre173 = load double, double* %17, align 8
  br label %.lr.ph65.split.us.new

.lr.ph65.split.us.new:                            ; preds = %.prol.loopexit157..lr.ph65.split.us.new_crit_edge, %.lr.ph65.split.us.new
  %22 = phi double [ %34, %.lr.ph65.split.us.new ], [ %.pre173, %.prol.loopexit157..lr.ph65.split.us.new_crit_edge ]
  %indvars.iv142 = phi i64 [ %indvars.iv.next143.3, %.lr.ph65.split.us.new ], [ %indvars.iv142.unr, %.prol.loopexit157..lr.ph65.split.us.new_crit_edge ]
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv142, i64 %indvars.iv146
  %24 = load double, double* %23, align 8
  %25 = fadd double %24, %22
  store double %25, double* %17, align 8
  %indvars.iv.next143 = add nuw nsw i64 %indvars.iv142, 1
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next143, i64 %indvars.iv146
  %27 = load double, double* %26, align 8
  %28 = fadd double %27, %25
  store double %28, double* %17, align 8
  %indvars.iv.next143.1 = add nsw i64 %indvars.iv142, 2
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next143.1, i64 %indvars.iv146
  %30 = load double, double* %29, align 8
  %31 = fadd double %30, %28
  store double %31, double* %17, align 8
  %indvars.iv.next143.2 = add nsw i64 %indvars.iv142, 3
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next143.2, i64 %indvars.iv146
  %33 = load double, double* %32, align 8
  %34 = fadd double %33, %31
  store double %34, double* %17, align 8
  %indvars.iv.next143.3 = add nsw i64 %indvars.iv142, 4
  %exitcond145.3 = icmp eq i64 %indvars.iv.next143.3, %wide.trip.count144.3
  br i1 %exitcond145.3, label %._crit_edge60.us.loopexit, label %.lr.ph65.split.us.new

._crit_edge60.us.loopexit:                        ; preds = %.lr.ph65.split.us.new
  br label %._crit_edge60.us

._crit_edge60.us:                                 ; preds = %._crit_edge60.us.loopexit, %.prol.loopexit157.._crit_edge60.us_crit_edge
  %35 = phi double [ %.pre174, %.prol.loopexit157.._crit_edge60.us_crit_edge ], [ %34, %._crit_edge60.us.loopexit ]
  %36 = fdiv double %35, %2
  store double %36, double* %17, align 8
  %indvars.iv.next147 = add nsw i64 %indvars.iv146, 1
  %37 = icmp slt i64 %indvars.iv.next147, %10
  br i1 %37, label %.lr.ph65.split.us, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge60.us
  br label %._crit_edge

._crit_edge.loopexit178.unr-lcssa:                ; preds = %.lr.ph65.split
  br label %._crit_edge.loopexit178

._crit_edge.loopexit178:                          ; preds = %.lr.ph65.split.prol.loopexit, %._crit_edge.loopexit178.unr-lcssa
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit178, %._crit_edge.loopexit
  br i1 true, label %.lr.ph52, label %._crit_edge.._crit_edge9_crit_edge

._crit_edge.._crit_edge9_crit_edge:               ; preds = %._crit_edge
  br label %._crit_edge9

.lr.ph52:                                         ; preds = %._crit_edge
  br i1 %9, label %.lr.ph52.split.us.preheader, label %.lr.ph52.split.preheader

.lr.ph52.split.preheader:                         ; preds = %.lr.ph52
  br label %.lr.ph52.split

.lr.ph52.split.us.preheader:                      ; preds = %.lr.ph52
  %38 = sext i32 %1 to i64
  %xtraiter184 = and i64 %38, 1
  %lcmp.mod185 = icmp eq i64 %xtraiter184, 0
  %39 = icmp eq i32 %1, 1
  br label %.lr.ph52.split.us

.lr.ph52.split.us:                                ; preds = %.lr.ph52.split.us.preheader, %._crit_edge48.us
  %indvars.iv136 = phi i64 [ 0, %.lr.ph52.split.us.preheader ], [ %indvars.iv.next137, %._crit_edge48.us ]
  %storemerge151.us = phi i64 [ 0, %.lr.ph52.split.us.preheader ], [ %indvars.iv.next137, %._crit_edge48.us ]
  %sext162 = shl i64 %storemerge151.us, 32
  %40 = ashr exact i64 %sext162, 32
  %41 = getelementptr inbounds double, double* %6, i64 %40
  store double 0.000000e+00, double* %41, align 8
  %42 = getelementptr inbounds double, double* %5, i64 %indvars.iv136
  %43 = getelementptr inbounds double, double* %6, i64 %indvars.iv136
  %.pre175 = load double, double* %43, align 8
  br i1 %lcmp.mod185, label %.prol.loopexit183.unr-lcssa, label %.prol.preheader182

.prol.preheader182:                               ; preds = %.lr.ph52.split.us
  br label %44

; <label>:44:                                     ; preds = %.prol.preheader182
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv136
  %46 = load double, double* %45, align 8
  %47 = load double, double* %42, align 8
  %48 = fsub double %46, %47
  %49 = fmul double %48, %48
  %50 = fadd double %.pre175, %49
  store double %50, double* %43, align 8
  br label %.prol.loopexit183.unr-lcssa

.prol.loopexit183.unr-lcssa:                      ; preds = %.lr.ph52.split.us, %44
  %.unr.ph = phi double [ %50, %44 ], [ %.pre175, %.lr.ph52.split.us ]
  %indvars.iv133.unr.ph = phi i64 [ 1, %44 ], [ 0, %.lr.ph52.split.us ]
  %.lcssa180.unr.ph = phi double [ %50, %44 ], [ undef, %.lr.ph52.split.us ]
  br label %.prol.loopexit183

.prol.loopexit183:                                ; preds = %.prol.loopexit183.unr-lcssa
  br i1 %39, label %._crit_edge48.us, label %.lr.ph52.split.us.new

.lr.ph52.split.us.new:                            ; preds = %.prol.loopexit183
  br label %51

; <label>:51:                                     ; preds = %51, %.lr.ph52.split.us.new
  %52 = phi double [ %.unr.ph, %.lr.ph52.split.us.new ], [ %64, %51 ]
  %indvars.iv133 = phi i64 [ %indvars.iv133.unr.ph, %.lr.ph52.split.us.new ], [ %indvars.iv.next134.1, %51 ]
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv133, i64 %indvars.iv136
  %54 = load double, double* %53, align 8
  %55 = load double, double* %42, align 8
  %56 = fsub double %54, %55
  %57 = fmul double %56, %56
  %58 = fadd double %52, %57
  store double %58, double* %43, align 8
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next134, i64 %indvars.iv136
  %60 = load double, double* %59, align 8
  %61 = load double, double* %42, align 8
  %62 = fsub double %60, %61
  %63 = fmul double %62, %62
  %64 = fadd double %58, %63
  store double %64, double* %43, align 8
  %indvars.iv.next134.1 = add nsw i64 %indvars.iv133, 2
  %65 = icmp slt i64 %indvars.iv.next134.1, %38
  br i1 %65, label %51, label %._crit_edge48.us.unr-lcssa

._crit_edge48.us.unr-lcssa:                       ; preds = %51
  br label %._crit_edge48.us

._crit_edge48.us:                                 ; preds = %.prol.loopexit183, %._crit_edge48.us.unr-lcssa
  %.lcssa180 = phi double [ %.lcssa180.unr.ph, %.prol.loopexit183 ], [ %64, %._crit_edge48.us.unr-lcssa ]
  %66 = fdiv double %.lcssa180, %2
  store double %66, double* %43, align 8
  %67 = tail call double @sqrt(double %66) #4
  %68 = fcmp ole double %67, 1.000000e-01
  %69 = select i1 %68, double 1.000000e+00, double %67
  store double %69, double* %43, align 8
  %indvars.iv.next137 = add nsw i64 %indvars.iv136, 1
  %70 = icmp slt i64 %indvars.iv.next137, %10
  br i1 %70, label %.lr.ph52.split.us, label %.._crit_edge9_crit_edge.loopexit

.lr.ph65.split:                                   ; preds = %.lr.ph65.split, %.lr.ph65.split.preheader.new
  %indvars.iv149 = phi i64 [ %indvars.iv149.unr, %.lr.ph65.split.preheader.new ], [ %indvars.iv.next150.1, %.lr.ph65.split ]
  %storemerge63 = phi i64 [ %storemerge63.unr, %.lr.ph65.split.preheader.new ], [ %indvars.iv.next150.1, %.lr.ph65.split ]
  %sext163 = shl i64 %storemerge63, 32
  %71 = ashr exact i64 %sext163, 32
  %72 = getelementptr inbounds double, double* %5, i64 %71
  store double 0.000000e+00, double* %72, align 8
  %73 = getelementptr inbounds double, double* %5, i64 %indvars.iv149
  %74 = load double, double* %73, align 8
  %75 = fdiv double %74, %2
  store double %75, double* %73, align 8
  %indvars.iv.next150 = add nuw nsw i64 %indvars.iv149, 1
  %sext163.1 = shl i64 %indvars.iv.next150, 32
  %76 = ashr exact i64 %sext163.1, 32
  %77 = getelementptr inbounds double, double* %5, i64 %76
  store double 0.000000e+00, double* %77, align 8
  %78 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next150
  %79 = load double, double* %78, align 8
  %80 = fdiv double %79, %2
  store double %80, double* %78, align 8
  %indvars.iv.next150.1 = add nsw i64 %indvars.iv149, 2
  %81 = icmp slt i64 %indvars.iv.next150.1, %10
  br i1 %81, label %.lr.ph65.split, label %._crit_edge.loopexit178.unr-lcssa

.._crit_edge9_crit_edge.loopexit:                 ; preds = %._crit_edge48.us
  br label %.._crit_edge9_crit_edge

.._crit_edge9_crit_edge.loopexit177:              ; preds = %.lr.ph52.split
  br label %.._crit_edge9_crit_edge

.._crit_edge9_crit_edge:                          ; preds = %.._crit_edge9_crit_edge.loopexit177, %.._crit_edge9_crit_edge.loopexit
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge.._crit_edge9_crit_edge, %._crit_edge.thread, %.._crit_edge9_crit_edge
  %82 = icmp sgt i32 %1, 0
  br i1 %82, label %._crit_edge10.lr.ph, label %._crit_edge11

._crit_edge10.lr.ph:                              ; preds = %._crit_edge9
  br i1 %8, label %._crit_edge10.us.preheader, label %.._crit_edge11_crit_edge.loopexit83

._crit_edge10.us.preheader:                       ; preds = %._crit_edge10.lr.ph
  %83 = sext i32 %0 to i64
  %84 = sext i32 %1 to i64
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %._crit_edge10.us.preheader, %._crit_edge38.us
  %indvars.iv131 = phi i64 [ 0, %._crit_edge10.us.preheader ], [ %indvars.iv.next132, %._crit_edge38.us ]
  br label %85

; <label>:85:                                     ; preds = %85, %._crit_edge10.us
  %indvars.iv129 = phi i64 [ %indvars.iv.next130, %85 ], [ 0, %._crit_edge10.us ]
  %86 = getelementptr inbounds double, double* %5, i64 %indvars.iv129
  %87 = load double, double* %86, align 8
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv131, i64 %indvars.iv129
  %89 = load double, double* %88, align 8
  %90 = fsub double %89, %87
  store double %90, double* %88, align 8
  %91 = tail call double @sqrt(double %2) #4
  %92 = getelementptr inbounds double, double* %6, i64 %indvars.iv129
  %93 = load double, double* %92, align 8
  %94 = fmul double %91, %93
  %95 = load double, double* %88, align 8
  %96 = fdiv double %95, %94
  store double %96, double* %88, align 8
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %97 = icmp slt i64 %indvars.iv.next130, %83
  br i1 %97, label %85, label %._crit_edge38.us

._crit_edge38.us:                                 ; preds = %85
  %indvars.iv.next132 = add nsw i64 %indvars.iv131, 1
  %98 = icmp slt i64 %indvars.iv.next132, %84
  br i1 %98, label %._crit_edge10.us, label %.._crit_edge11_crit_edge.loopexit

.lr.ph52.split:                                   ; preds = %.lr.ph52.split.preheader, %.lr.ph52.split
  %indvars.iv139 = phi i64 [ 0, %.lr.ph52.split.preheader ], [ %indvars.iv.next140, %.lr.ph52.split ]
  %storemerge151 = phi i64 [ 0, %.lr.ph52.split.preheader ], [ %indvars.iv.next140, %.lr.ph52.split ]
  %sext161 = shl i64 %storemerge151, 32
  %99 = ashr exact i64 %sext161, 32
  %100 = getelementptr inbounds double, double* %6, i64 %99
  store double 0.000000e+00, double* %100, align 8
  %101 = getelementptr inbounds double, double* %6, i64 %indvars.iv139
  %102 = load double, double* %101, align 8
  %103 = fdiv double %102, %2
  store double %103, double* %101, align 8
  %104 = tail call double @sqrt(double %103) #4
  %105 = fcmp ole double %104, 1.000000e-01
  %106 = select i1 %105, double 1.000000e+00, double %104
  store double %106, double* %101, align 8
  %indvars.iv.next140 = add nsw i64 %indvars.iv139, 1
  %107 = icmp slt i64 %indvars.iv.next140, %10
  br i1 %107, label %.lr.ph52.split, label %.._crit_edge9_crit_edge.loopexit177

.._crit_edge11_crit_edge.loopexit:                ; preds = %._crit_edge38.us
  br label %.._crit_edge11_crit_edge

.._crit_edge11_crit_edge.loopexit83:              ; preds = %._crit_edge10.lr.ph
  br label %.._crit_edge11_crit_edge

.._crit_edge11_crit_edge:                         ; preds = %.._crit_edge11_crit_edge.loopexit83, %.._crit_edge11_crit_edge.loopexit
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %.._crit_edge11_crit_edge, %._crit_edge9
  %108 = add nsw i32 %0, -1
  %109 = icmp sgt i32 %0, 1
  br i1 %109, label %.lr.ph27, label %163

.lr.ph27:                                         ; preds = %._crit_edge11
  %110 = add i32 %0, -2
  br i1 %82, label %.lr.ph27.split.us.preheader, label %.lr.ph27.split.preheader

.lr.ph27.split.preheader:                         ; preds = %.lr.ph27
  %111 = sext i32 %108 to i64
  %112 = sext i32 %0 to i64
  %113 = add i32 %0, 1
  br label %.lr.ph27.split

.lr.ph27.split.us.preheader:                      ; preds = %.lr.ph27
  %114 = sext i32 %0 to i64
  %115 = sext i32 %108 to i64
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %116 = icmp eq i32 %1, 1
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.lr.ph27.split.us

.lr.ph27.split.us:                                ; preds = %.lr.ph27.split.us.preheader, %._crit_edge21.us-lcssa.us.us
  %indvars.iv110 = phi i64 [ 0, %.lr.ph27.split.us.preheader ], [ %indvars.iv.next111, %._crit_edge21.us-lcssa.us.us ]
  %indvars.iv100 = phi i64 [ 1, %.lr.ph27.split.us.preheader ], [ %indvars.iv.next101, %._crit_edge21.us-lcssa.us.us ]
  %storemerge326.us = phi i64 [ 0, %.lr.ph27.split.us.preheader ], [ %indvars.iv.next111, %._crit_edge21.us-lcssa.us.us ]
  %sext160 = shl i64 %storemerge326.us, 32
  %117 = ashr exact i64 %sext160, 32
  %118 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %117, i64 %117
  store double 1.000000e+00, double* %118, align 8
  %indvars.iv.next111 = add nsw i64 %indvars.iv110, 1
  %119 = icmp slt i64 %indvars.iv.next111, %114
  br i1 %119, label %.lr.ph.us.us.preheader, label %._crit_edge21.us-lcssa.us.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph27.split.us
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv110
  br label %.lr.ph.us.us

._crit_edge21.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge15.us.us
  br label %._crit_edge21.us-lcssa.us.us

._crit_edge21.us-lcssa.us.us:                     ; preds = %._crit_edge21.us-lcssa.us.us.loopexit, %.lr.ph27.split.us
  %121 = icmp slt i64 %indvars.iv.next111, %115
  %indvars.iv.next101 = add nsw i64 %indvars.iv100, 1
  br i1 %121, label %.lr.ph27.split.us, label %._crit_edge28.loopexit

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge15.us.us
  %indvars.iv102 = phi i64 [ %indvars.iv.next103, %._crit_edge15.us.us ], [ %indvars.iv100, %.lr.ph.us.us.preheader ]
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv110, i64 %indvars.iv102
  store double 0.000000e+00, double* %122, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %123 = load double, double* %120, align 8
  %124 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv102
  %125 = load double, double* %124, align 8
  %126 = fmul double %123, %125
  %127 = fadd double %126, 0.000000e+00
  store double %127, double* %122, align 8
  %128 = bitcast double %127 to i64
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %129 = phi i64 [ %128, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %130 = phi double [ %127, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %116, label %._crit_edge15.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge15.us.us.loopexit:                     ; preds = %.lr.ph.us.us.new
  %131 = bitcast double %147 to i64
  br label %._crit_edge15.us.us

._crit_edge15.us.us:                              ; preds = %._crit_edge15.us.us.loopexit, %.prol.loopexit
  %132 = phi i64 [ %129, %.prol.loopexit ], [ %131, %._crit_edge15.us.us.loopexit ]
  %133 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv102, i64 %indvars.iv110
  %134 = bitcast double* %133 to i64*
  store i64 %132, i64* %134, align 8
  %indvars.iv.next103 = add nsw i64 %indvars.iv102, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next103 to i32
  %exitcond108 = icmp eq i32 %lftr.wideiv, %0
  br i1 %exitcond108, label %._crit_edge21.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %135 = phi double [ %147, %.lr.ph.us.us.new ], [ %130, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %136 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv110
  %137 = load double, double* %136, align 8
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv102
  %139 = load double, double* %138, align 8
  %140 = fmul double %137, %139
  %141 = fadd double %140, %135
  store double %141, double* %122, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv110
  %143 = load double, double* %142, align 8
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv102
  %145 = load double, double* %144, align 8
  %146 = fmul double %143, %145
  %147 = fadd double %146, %141
  store double %147, double* %122, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge15.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph27.split:                                   ; preds = %.lr.ph27.split.preheader, %._crit_edge21
  %indvar = phi i32 [ 0, %.lr.ph27.split.preheader ], [ %indvar.next, %._crit_edge21 ]
  %indvars.iv125 = phi i64 [ 0, %.lr.ph27.split.preheader ], [ %indvars.iv.next126, %._crit_edge21 ]
  %indvars.iv114 = phi i64 [ 1, %.lr.ph27.split.preheader ], [ %indvars.iv.next115, %._crit_edge21 ]
  %storemerge326 = phi i64 [ 0, %.lr.ph27.split.preheader ], [ %indvars.iv.next126, %._crit_edge21 ]
  %sext = shl i64 %storemerge326, 32
  %148 = ashr exact i64 %sext, 32
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %148, i64 %148
  store double 1.000000e+00, double* %149, align 8
  %indvars.iv.next126 = add nsw i64 %indvars.iv125, 1
  %150 = icmp slt i64 %indvars.iv.next126, %112
  br i1 %150, label %.lr.ph20, label %._crit_edge21

.lr.ph20:                                         ; preds = %.lr.ph27.split
  %151 = sub i32 %113, %indvar
  %xtraiter154 = and i32 %151, 1
  %lcmp.mod155 = icmp eq i32 %xtraiter154, 0
  br i1 %lcmp.mod155, label %.prol.loopexit153, label %.prol.preheader152

.prol.preheader152:                               ; preds = %.lr.ph20
  %152 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv125, i64 %indvars.iv114
  store double 0.000000e+00, double* %152, align 8
  %153 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv114, i64 %indvars.iv125
  %154 = bitcast double* %153 to i64*
  store i64 0, i64* %154, align 8
  %indvars.iv.next117.prol = add nsw i64 %indvars.iv114, 1
  br label %.prol.loopexit153

.prol.loopexit153:                                ; preds = %.prol.preheader152, %.lr.ph20
  %indvars.iv116.unr.ph = phi i64 [ %indvars.iv.next117.prol, %.prol.preheader152 ], [ %indvars.iv114, %.lr.ph20 ]
  %155 = icmp eq i32 %110, %indvar
  br i1 %155, label %._crit_edge21, label %.lr.ph20.new.preheader

.lr.ph20.new.preheader:                           ; preds = %.prol.loopexit153
  br label %.lr.ph20.new

.lr.ph20.new:                                     ; preds = %.lr.ph20.new.preheader, %.lr.ph20.new
  %indvars.iv116 = phi i64 [ %indvars.iv.next117.1, %.lr.ph20.new ], [ %indvars.iv116.unr.ph, %.lr.ph20.new.preheader ]
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv125, i64 %indvars.iv116
  store double 0.000000e+00, double* %156, align 8
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv116, i64 %indvars.iv125
  %158 = bitcast double* %157 to i64*
  store i64 0, i64* %158, align 8
  %indvars.iv.next117 = add nsw i64 %indvars.iv116, 1
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv125, i64 %indvars.iv.next117
  store double 0.000000e+00, double* %159, align 8
  %160 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next117, i64 %indvars.iv125
  %161 = bitcast double* %160 to i64*
  store i64 0, i64* %161, align 8
  %indvars.iv.next117.1 = add nsw i64 %indvars.iv116, 2
  %lftr.wideiv122.1 = trunc i64 %indvars.iv.next117.1 to i32
  %exitcond123.1 = icmp eq i32 %lftr.wideiv122.1, %0
  br i1 %exitcond123.1, label %._crit_edge21.loopexit, label %.lr.ph20.new

._crit_edge21.loopexit:                           ; preds = %.lr.ph20.new
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit, %.prol.loopexit153, %.lr.ph27.split
  %162 = icmp slt i64 %indvars.iv.next126, %111
  %indvars.iv.next115 = add nsw i64 %indvars.iv114, 1
  %indvar.next = add i32 %indvar, 1
  br i1 %162, label %.lr.ph27.split, label %._crit_edge28.loopexit176

._crit_edge28.loopexit:                           ; preds = %._crit_edge21.us-lcssa.us.us
  br label %._crit_edge28

._crit_edge28.loopexit176:                        ; preds = %._crit_edge21
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %._crit_edge28.loopexit176, %._crit_edge28.loopexit
  br label %163

; <label>:163:                                    ; preds = %._crit_edge28, %._crit_edge11
  %164 = sext i32 %108 to i64
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %164, i64 %164
  store double 1.000000e+00, double* %165, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %._crit_edge.lr.ph, label %22

._crit_edge.lr.ph:                                ; preds = %2
  br i1 true, label %._crit_edge.us.preheader, label %._crit_edge6.loopexit11

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge4.us
  %indvars.iv13 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next14, %._crit_edge4.us ]
  %9 = mul nsw i64 %indvars.iv13, %8
  br label %10

; <label>:10:                                     ; preds = %._crit_edge2.us, %._crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge2.us ], [ 0, %._crit_edge.us ]
  %11 = add nsw i64 %9, %indvars.iv
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge2.us

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %10, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge4.us, label %10

._crit_edge4.us:                                  ; preds = %._crit_edge2.us
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %21 = icmp slt i64 %indvars.iv.next14, %8
  br i1 %21, label %._crit_edge.us, label %._crit_edge6.loopexit

._crit_edge6.loopexit:                            ; preds = %._crit_edge4.us
  br label %._crit_edge6

._crit_edge6.loopexit11:                          ; preds = %._crit_edge.lr.ph
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit11, %._crit_edge6.loopexit
  br label %22

; <label>:22:                                     ; preds = %._crit_edge6, %2
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
