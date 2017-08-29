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
define internal fastcc void @init_array(i32, i32, double*, [1200 x double]*) unnamed_addr #2 {
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
  %exitcond = icmp eq i64 %indvars.iv.next7, 1400
  br i1 %exitcond, label %23, label %._crit_edge

; <label>:23:                                     ; preds = %22
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]*, [1200 x double]*, double*, double*) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph78, label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %7
  br label %._crit_edge9

.lr.ph78:                                         ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph78.split.us.preheader, label %.lr.ph78.split.preheader

.lr.ph78.split.preheader:                         ; preds = %.lr.ph78
  %10 = sext i32 %0 to i64
  %xtraiter187 = and i64 %10, 1
  %lcmp.mod188 = icmp eq i64 %xtraiter187, 0
  br i1 %lcmp.mod188, label %.lr.ph78.split.prol.loopexit, label %.lr.ph78.split.prol.preheader

.lr.ph78.split.prol.preheader:                    ; preds = %.lr.ph78.split.preheader
  br label %.lr.ph78.split.prol

.lr.ph78.split.prol:                              ; preds = %.lr.ph78.split.prol.preheader
  %11 = fdiv double 0.000000e+00, %2
  store double %11, double* %5, align 8
  br label %.lr.ph78.split.prol.loopexit

.lr.ph78.split.prol.loopexit:                     ; preds = %.lr.ph78.split.preheader, %.lr.ph78.split.prol
  %indvars.iv157.unr = phi i64 [ 0, %.lr.ph78.split.preheader ], [ 1, %.lr.ph78.split.prol ]
  %storemerge76.unr = phi i64 [ 0, %.lr.ph78.split.preheader ], [ 1, %.lr.ph78.split.prol ]
  %12 = icmp eq i32 %0, 1
  br i1 %12, label %._crit_edge.loopexit179, label %.lr.ph78.split.preheader.new

.lr.ph78.split.preheader.new:                     ; preds = %.lr.ph78.split.prol.loopexit
  br label %.lr.ph78.split

.lr.ph78.split.us.preheader:                      ; preds = %.lr.ph78
  %13 = add i32 %1, -1
  %14 = sext i32 %0 to i64
  %xtraiter152 = and i32 %1, 3
  %lcmp.mod153 = icmp eq i32 %xtraiter152, 0
  %15 = icmp ult i32 %13, 3
  %wide.trip.count148.3 = zext i32 %1 to i64
  br label %.lr.ph78.split.us

.lr.ph78.split.us:                                ; preds = %.lr.ph78.split.us.preheader, %._crit_edge73.us
  %indvars.iv154 = phi i64 [ 0, %.lr.ph78.split.us.preheader ], [ %indvars.iv.next155, %._crit_edge73.us ]
  %storemerge76.us = phi i64 [ 0, %.lr.ph78.split.us.preheader ], [ %indvars.iv.next155, %._crit_edge73.us ]
  %sext165 = shl i64 %storemerge76.us, 32
  %16 = ashr exact i64 %sext165, 32
  %17 = getelementptr inbounds double, double* %5, i64 %16
  store double 0.000000e+00, double* %17, align 8
  %18 = getelementptr inbounds double, double* %5, i64 %indvars.iv154
  br i1 %lcmp.mod153, label %.prol.loopexit151, label %.lr.ph78.split.us..prol.preheader150_crit_edge

.lr.ph78.split.us..prol.preheader150_crit_edge:   ; preds = %.lr.ph78.split.us
  %.pre = load double, double* %18, align 8
  br label %.prol.preheader150

.prol.preheader150:                               ; preds = %.lr.ph78.split.us..prol.preheader150_crit_edge, %.prol.preheader150
  %19 = phi double [ %22, %.prol.preheader150 ], [ %.pre, %.lr.ph78.split.us..prol.preheader150_crit_edge ]
  %indvars.iv146.prol = phi i64 [ %indvars.iv.next147.prol, %.prol.preheader150 ], [ 0, %.lr.ph78.split.us..prol.preheader150_crit_edge ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader150 ], [ %xtraiter152, %.lr.ph78.split.us..prol.preheader150_crit_edge ]
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv146.prol, i64 %indvars.iv154
  %21 = load double, double* %20, align 8
  %22 = fadd double %21, %19
  store double %22, double* %18, align 8
  %indvars.iv.next147.prol = add nuw nsw i64 %indvars.iv146.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit151.loopexit, label %.prol.preheader150, !llvm.loop !1

.prol.loopexit151.loopexit:                       ; preds = %.prol.preheader150
  br label %.prol.loopexit151

.prol.loopexit151:                                ; preds = %.prol.loopexit151.loopexit, %.lr.ph78.split.us
  %indvars.iv146.unr = phi i64 [ 0, %.lr.ph78.split.us ], [ %indvars.iv.next147.prol, %.prol.loopexit151.loopexit ]
  br i1 %15, label %.prol.loopexit151.._crit_edge73.us_crit_edge, label %.prol.loopexit151..lr.ph78.split.us.new_crit_edge

.prol.loopexit151.._crit_edge73.us_crit_edge:     ; preds = %.prol.loopexit151
  %.pre175 = load double, double* %18, align 8
  br label %._crit_edge73.us

.prol.loopexit151..lr.ph78.split.us.new_crit_edge: ; preds = %.prol.loopexit151
  %.pre174 = load double, double* %18, align 8
  br label %.lr.ph78.split.us.new

.lr.ph78.split.us.new:                            ; preds = %.prol.loopexit151..lr.ph78.split.us.new_crit_edge, %.lr.ph78.split.us.new
  %23 = phi double [ %35, %.lr.ph78.split.us.new ], [ %.pre174, %.prol.loopexit151..lr.ph78.split.us.new_crit_edge ]
  %indvars.iv146 = phi i64 [ %indvars.iv.next147.3, %.lr.ph78.split.us.new ], [ %indvars.iv146.unr, %.prol.loopexit151..lr.ph78.split.us.new_crit_edge ]
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv146, i64 %indvars.iv154
  %25 = load double, double* %24, align 8
  %26 = fadd double %25, %23
  store double %26, double* %18, align 8
  %indvars.iv.next147 = add nuw nsw i64 %indvars.iv146, 1
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next147, i64 %indvars.iv154
  %28 = load double, double* %27, align 8
  %29 = fadd double %28, %26
  store double %29, double* %18, align 8
  %indvars.iv.next147.1 = add nsw i64 %indvars.iv146, 2
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next147.1, i64 %indvars.iv154
  %31 = load double, double* %30, align 8
  %32 = fadd double %31, %29
  store double %32, double* %18, align 8
  %indvars.iv.next147.2 = add nsw i64 %indvars.iv146, 3
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next147.2, i64 %indvars.iv154
  %34 = load double, double* %33, align 8
  %35 = fadd double %34, %32
  store double %35, double* %18, align 8
  %indvars.iv.next147.3 = add nsw i64 %indvars.iv146, 4
  %exitcond149.3 = icmp eq i64 %indvars.iv.next147.3, %wide.trip.count148.3
  br i1 %exitcond149.3, label %._crit_edge73.us.loopexit, label %.lr.ph78.split.us.new

._crit_edge73.us.loopexit:                        ; preds = %.lr.ph78.split.us.new
  br label %._crit_edge73.us

._crit_edge73.us:                                 ; preds = %._crit_edge73.us.loopexit, %.prol.loopexit151.._crit_edge73.us_crit_edge
  %36 = phi double [ %.pre175, %.prol.loopexit151.._crit_edge73.us_crit_edge ], [ %35, %._crit_edge73.us.loopexit ]
  %37 = fdiv double %36, %2
  store double %37, double* %18, align 8
  %indvars.iv.next155 = add nsw i64 %indvars.iv154, 1
  %38 = icmp slt i64 %indvars.iv.next155, %14
  br i1 %38, label %.lr.ph78.split.us, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge73.us
  br label %._crit_edge

._crit_edge.loopexit179.unr-lcssa:                ; preds = %.lr.ph78.split
  br label %._crit_edge.loopexit179

._crit_edge.loopexit179:                          ; preds = %.lr.ph78.split.prol.loopexit, %._crit_edge.loopexit179.unr-lcssa
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit179, %._crit_edge.loopexit
  br i1 true, label %.lr.ph65, label %._crit_edge.._crit_edge9_crit_edge

._crit_edge.._crit_edge9_crit_edge:               ; preds = %._crit_edge
  br label %._crit_edge9

.lr.ph65:                                         ; preds = %._crit_edge
  br i1 %9, label %.lr.ph65.split.us.preheader, label %.lr.ph65.split.preheader

.lr.ph65.split.preheader:                         ; preds = %.lr.ph65
  %39 = sext i32 %0 to i64
  br label %.lr.ph65.split

.lr.ph65.split.us.preheader:                      ; preds = %.lr.ph65
  %40 = sext i32 %1 to i64
  %41 = sext i32 %0 to i64
  %xtraiter185 = and i64 %40, 1
  %lcmp.mod186 = icmp eq i64 %xtraiter185, 0
  %42 = icmp eq i32 %1, 1
  br label %.lr.ph65.split.us

.lr.ph65.split.us:                                ; preds = %.lr.ph65.split.us.preheader, %._crit_edge61.us
  %indvars.iv140 = phi i64 [ 0, %.lr.ph65.split.us.preheader ], [ %indvars.iv.next141, %._crit_edge61.us ]
  %storemerge164.us = phi i64 [ 0, %.lr.ph65.split.us.preheader ], [ %indvars.iv.next141, %._crit_edge61.us ]
  %sext163 = shl i64 %storemerge164.us, 32
  %43 = ashr exact i64 %sext163, 32
  %44 = getelementptr inbounds double, double* %6, i64 %43
  store double 0.000000e+00, double* %44, align 8
  %45 = getelementptr inbounds double, double* %5, i64 %indvars.iv140
  %46 = getelementptr inbounds double, double* %6, i64 %indvars.iv140
  %.pre176 = load double, double* %46, align 8
  br i1 %lcmp.mod186, label %.prol.loopexit184.unr-lcssa, label %.prol.preheader183

.prol.preheader183:                               ; preds = %.lr.ph65.split.us
  br label %47

; <label>:47:                                     ; preds = %.prol.preheader183
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv140
  %49 = load double, double* %48, align 8
  %50 = load double, double* %45, align 8
  %51 = fsub double %49, %50
  %52 = fmul double %51, %51
  %53 = fadd double %.pre176, %52
  store double %53, double* %46, align 8
  br label %.prol.loopexit184.unr-lcssa

.prol.loopexit184.unr-lcssa:                      ; preds = %.lr.ph65.split.us, %47
  %.unr.ph = phi double [ %53, %47 ], [ %.pre176, %.lr.ph65.split.us ]
  %indvars.iv137.unr.ph = phi i64 [ 1, %47 ], [ 0, %.lr.ph65.split.us ]
  %.lcssa181.unr.ph = phi double [ %53, %47 ], [ undef, %.lr.ph65.split.us ]
  br label %.prol.loopexit184

.prol.loopexit184:                                ; preds = %.prol.loopexit184.unr-lcssa
  br i1 %42, label %._crit_edge61.us, label %.lr.ph65.split.us.new

.lr.ph65.split.us.new:                            ; preds = %.prol.loopexit184
  br label %54

; <label>:54:                                     ; preds = %54, %.lr.ph65.split.us.new
  %55 = phi double [ %.unr.ph, %.lr.ph65.split.us.new ], [ %67, %54 ]
  %indvars.iv137 = phi i64 [ %indvars.iv137.unr.ph, %.lr.ph65.split.us.new ], [ %indvars.iv.next138.1, %54 ]
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv137, i64 %indvars.iv140
  %57 = load double, double* %56, align 8
  %58 = load double, double* %45, align 8
  %59 = fsub double %57, %58
  %60 = fmul double %59, %59
  %61 = fadd double %55, %60
  store double %61, double* %46, align 8
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next138, i64 %indvars.iv140
  %63 = load double, double* %62, align 8
  %64 = load double, double* %45, align 8
  %65 = fsub double %63, %64
  %66 = fmul double %65, %65
  %67 = fadd double %61, %66
  store double %67, double* %46, align 8
  %indvars.iv.next138.1 = add nsw i64 %indvars.iv137, 2
  %68 = icmp slt i64 %indvars.iv.next138.1, %40
  br i1 %68, label %54, label %._crit_edge61.us.unr-lcssa

._crit_edge61.us.unr-lcssa:                       ; preds = %54
  br label %._crit_edge61.us

._crit_edge61.us:                                 ; preds = %.prol.loopexit184, %._crit_edge61.us.unr-lcssa
  %.lcssa181 = phi double [ %.lcssa181.unr.ph, %.prol.loopexit184 ], [ %67, %._crit_edge61.us.unr-lcssa ]
  %69 = fdiv double %.lcssa181, %2
  store double %69, double* %46, align 8
  %70 = tail call double @sqrt(double %69) #4
  %71 = fcmp ole double %70, 1.000000e-01
  %72 = select i1 %71, double 1.000000e+00, double %70
  store double %72, double* %46, align 8
  %indvars.iv.next141 = add nsw i64 %indvars.iv140, 1
  %73 = icmp slt i64 %indvars.iv.next141, %41
  br i1 %73, label %.lr.ph65.split.us, label %.._crit_edge9_crit_edge.loopexit

.lr.ph78.split:                                   ; preds = %.lr.ph78.split, %.lr.ph78.split.preheader.new
  %indvars.iv157 = phi i64 [ %indvars.iv157.unr, %.lr.ph78.split.preheader.new ], [ %indvars.iv.next158.1, %.lr.ph78.split ]
  %storemerge76 = phi i64 [ %storemerge76.unr, %.lr.ph78.split.preheader.new ], [ %indvars.iv.next158.1, %.lr.ph78.split ]
  %sext164 = shl i64 %storemerge76, 32
  %74 = ashr exact i64 %sext164, 32
  %75 = getelementptr inbounds double, double* %5, i64 %74
  store double 0.000000e+00, double* %75, align 8
  %76 = getelementptr inbounds double, double* %5, i64 %indvars.iv157
  %77 = load double, double* %76, align 8
  %78 = fdiv double %77, %2
  store double %78, double* %76, align 8
  %indvars.iv.next158 = add nuw nsw i64 %indvars.iv157, 1
  %sext164.1 = shl i64 %indvars.iv.next158, 32
  %79 = ashr exact i64 %sext164.1, 32
  %80 = getelementptr inbounds double, double* %5, i64 %79
  store double 0.000000e+00, double* %80, align 8
  %81 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next158
  %82 = load double, double* %81, align 8
  %83 = fdiv double %82, %2
  store double %83, double* %81, align 8
  %indvars.iv.next158.1 = add nsw i64 %indvars.iv157, 2
  %84 = icmp slt i64 %indvars.iv.next158.1, %10
  br i1 %84, label %.lr.ph78.split, label %._crit_edge.loopexit179.unr-lcssa

.._crit_edge9_crit_edge.loopexit:                 ; preds = %._crit_edge61.us
  br label %.._crit_edge9_crit_edge

.._crit_edge9_crit_edge.loopexit178:              ; preds = %.lr.ph65.split
  br label %.._crit_edge9_crit_edge

.._crit_edge9_crit_edge:                          ; preds = %.._crit_edge9_crit_edge.loopexit178, %.._crit_edge9_crit_edge.loopexit
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge.._crit_edge9_crit_edge, %._crit_edge.thread, %.._crit_edge9_crit_edge
  %85 = icmp sgt i32 %1, 0
  br i1 %85, label %._crit_edge10.lr.ph, label %._crit_edge11

._crit_edge10.lr.ph:                              ; preds = %._crit_edge9
  br i1 %8, label %._crit_edge10.us.preheader, label %.._crit_edge11_crit_edge.loopexit84

._crit_edge10.us.preheader:                       ; preds = %._crit_edge10.lr.ph
  %86 = sext i32 %0 to i64
  %87 = sext i32 %1 to i64
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %._crit_edge10.us.preheader, %._crit_edge51.us
  %indvars.iv135 = phi i64 [ 0, %._crit_edge10.us.preheader ], [ %indvars.iv.next136, %._crit_edge51.us ]
  br label %88

; <label>:88:                                     ; preds = %._crit_edge10.us, %88
  %indvars.iv133 = phi i64 [ 0, %._crit_edge10.us ], [ %indvars.iv.next134, %88 ]
  %89 = getelementptr inbounds double, double* %5, i64 %indvars.iv133
  %90 = load double, double* %89, align 8
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv135, i64 %indvars.iv133
  %92 = load double, double* %91, align 8
  %93 = fsub double %92, %90
  store double %93, double* %91, align 8
  %94 = tail call double @sqrt(double %2) #4
  %95 = getelementptr inbounds double, double* %6, i64 %indvars.iv133
  %96 = load double, double* %95, align 8
  %97 = fmul double %94, %96
  %98 = load double, double* %91, align 8
  %99 = fdiv double %98, %97
  store double %99, double* %91, align 8
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %100 = icmp slt i64 %indvars.iv.next134, %86
  br i1 %100, label %88, label %._crit_edge51.us

._crit_edge51.us:                                 ; preds = %88
  %indvars.iv.next136 = add nsw i64 %indvars.iv135, 1
  %101 = icmp slt i64 %indvars.iv.next136, %87
  br i1 %101, label %._crit_edge10.us, label %.._crit_edge11_crit_edge.loopexit

.lr.ph65.split:                                   ; preds = %.lr.ph65.split.preheader, %.lr.ph65.split
  %indvars.iv143 = phi i64 [ 0, %.lr.ph65.split.preheader ], [ %indvars.iv.next144, %.lr.ph65.split ]
  %storemerge164 = phi i64 [ 0, %.lr.ph65.split.preheader ], [ %indvars.iv.next144, %.lr.ph65.split ]
  %sext162 = shl i64 %storemerge164, 32
  %102 = ashr exact i64 %sext162, 32
  %103 = getelementptr inbounds double, double* %6, i64 %102
  store double 0.000000e+00, double* %103, align 8
  %104 = getelementptr inbounds double, double* %6, i64 %indvars.iv143
  %105 = load double, double* %104, align 8
  %106 = fdiv double %105, %2
  store double %106, double* %104, align 8
  %107 = tail call double @sqrt(double %106) #4
  %108 = fcmp ole double %107, 1.000000e-01
  %109 = select i1 %108, double 1.000000e+00, double %107
  store double %109, double* %104, align 8
  %indvars.iv.next144 = add nsw i64 %indvars.iv143, 1
  %110 = icmp slt i64 %indvars.iv.next144, %39
  br i1 %110, label %.lr.ph65.split, label %.._crit_edge9_crit_edge.loopexit178

.._crit_edge11_crit_edge.loopexit:                ; preds = %._crit_edge51.us
  br label %.._crit_edge11_crit_edge

.._crit_edge11_crit_edge.loopexit84:              ; preds = %._crit_edge10.lr.ph
  br label %.._crit_edge11_crit_edge

.._crit_edge11_crit_edge:                         ; preds = %.._crit_edge11_crit_edge.loopexit84, %.._crit_edge11_crit_edge.loopexit
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %.._crit_edge11_crit_edge, %._crit_edge9
  %111 = add nsw i32 %0, -1
  %112 = icmp sgt i32 %0, 1
  br i1 %112, label %.lr.ph28, label %170

.lr.ph28:                                         ; preds = %._crit_edge11
  br i1 %85, label %.lr.ph28.split.us.preheader, label %.lr.ph28.split.preheader

.lr.ph28.split.preheader:                         ; preds = %.lr.ph28
  %113 = add i32 %0, -2
  %114 = add i32 %0, 1
  %115 = zext i32 %114 to i64
  %116 = zext i32 %113 to i64
  %117 = sext i32 %111 to i64
  %118 = sext i32 %0 to i64
  br label %.lr.ph28.split

.lr.ph28.split.us.preheader:                      ; preds = %.lr.ph28
  %119 = sext i32 %0 to i64
  %120 = sext i32 %111 to i64
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %121 = icmp eq i32 %1, 1
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.lr.ph28.split.us

.lr.ph28.split.us:                                ; preds = %.lr.ph28.split.us.preheader, %._crit_edge22.us-lcssa.us.us
  %indvars.iv110 = phi i64 [ 0, %.lr.ph28.split.us.preheader ], [ %indvars.iv.next111, %._crit_edge22.us-lcssa.us.us ]
  %indvars.iv101 = phi i64 [ 1, %.lr.ph28.split.us.preheader ], [ %indvars.iv.next102, %._crit_edge22.us-lcssa.us.us ]
  %storemerge327.us = phi i64 [ 0, %.lr.ph28.split.us.preheader ], [ %indvars.iv.next111, %._crit_edge22.us-lcssa.us.us ]
  %sext161 = shl i64 %storemerge327.us, 32
  %122 = ashr exact i64 %sext161, 32
  %123 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %122, i64 %122
  store double 1.000000e+00, double* %123, align 8
  %indvars.iv.next111 = add nsw i64 %indvars.iv110, 1
  %124 = icmp slt i64 %indvars.iv.next111, %119
  br i1 %124, label %.lr.ph.us.us.preheader, label %._crit_edge22.us-lcssa.us.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph28.split.us
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv110
  br label %.lr.ph.us.us

._crit_edge22.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge16.us.us
  br label %._crit_edge22.us-lcssa.us.us

._crit_edge22.us-lcssa.us.us:                     ; preds = %._crit_edge22.us-lcssa.us.us.loopexit, %.lr.ph28.split.us
  %126 = icmp slt i64 %indvars.iv.next111, %120
  %indvars.iv.next102 = add nsw i64 %indvars.iv101, 1
  br i1 %126, label %.lr.ph28.split.us, label %._crit_edge29.loopexit

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge16.us.us
  %indvars.iv103 = phi i64 [ %indvars.iv.next104, %._crit_edge16.us.us ], [ %indvars.iv101, %.lr.ph.us.us.preheader ]
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv110, i64 %indvars.iv103
  store double 0.000000e+00, double* %127, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %128 = load double, double* %125, align 8
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv103
  %130 = load double, double* %129, align 8
  %131 = fmul double %128, %130
  %132 = fadd double %131, 0.000000e+00
  store double %132, double* %127, align 8
  %133 = bitcast double %132 to i64
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %134 = phi i64 [ %133, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %135 = phi double [ %132, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %121, label %._crit_edge16.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge16.us.us.loopexit:                     ; preds = %.lr.ph.us.us.new
  %136 = bitcast double %152 to i64
  br label %._crit_edge16.us.us

._crit_edge16.us.us:                              ; preds = %._crit_edge16.us.us.loopexit, %.prol.loopexit
  %137 = phi i64 [ %134, %.prol.loopexit ], [ %136, %._crit_edge16.us.us.loopexit ]
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv103, i64 %indvars.iv110
  %139 = bitcast double* %138 to i64*
  store i64 %137, i64* %139, align 8
  %indvars.iv.next104 = add nsw i64 %indvars.iv103, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next104 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %0
  br i1 %exitcond, label %._crit_edge22.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %140 = phi double [ %152, %.lr.ph.us.us.new ], [ %135, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %141 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv110
  %142 = load double, double* %141, align 8
  %143 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv103
  %144 = load double, double* %143, align 8
  %145 = fmul double %142, %144
  %146 = fadd double %145, %140
  store double %146, double* %127, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv110
  %148 = load double, double* %147, align 8
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv103
  %150 = load double, double* %149, align 8
  %151 = fmul double %148, %150
  %152 = fadd double %151, %146
  store double %152, double* %127, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge16.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph28.split:                                   ; preds = %.lr.ph28.split.preheader, %._crit_edge22
  %indvars.iv129 = phi i64 [ 0, %.lr.ph28.split.preheader ], [ %indvars.iv.next130, %._crit_edge22 ]
  %indvar = phi i64 [ 0, %.lr.ph28.split.preheader ], [ %indvar.next, %._crit_edge22 ]
  %indvars.iv114 = phi i64 [ 1, %.lr.ph28.split.preheader ], [ %indvars.iv.next115, %._crit_edge22 ]
  %storemerge327 = phi i64 [ 0, %.lr.ph28.split.preheader ], [ %indvars.iv.next130, %._crit_edge22 ]
  %153 = sub i64 %116, %indvar
  %154 = trunc i64 %153 to i32
  %sext = shl i64 %storemerge327, 32
  %155 = ashr exact i64 %sext, 32
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %155, i64 %155
  store double 1.000000e+00, double* %156, align 8
  %indvars.iv.next130 = add nsw i64 %indvars.iv129, 1
  %157 = icmp slt i64 %indvars.iv.next130, %118
  br i1 %157, label %.lr.ph21, label %._crit_edge22

.lr.ph21:                                         ; preds = %.lr.ph28.split
  %158 = sub i64 %115, %indvar
  %xtraiter127160 = and i64 %158, 1
  %lcmp.mod128 = icmp eq i64 %xtraiter127160, 0
  br i1 %lcmp.mod128, label %.prol.loopexit126, label %.prol.preheader125

.prol.preheader125:                               ; preds = %.lr.ph21
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv129, i64 %indvars.iv114
  store double 0.000000e+00, double* %159, align 8
  %160 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv114, i64 %indvars.iv129
  %161 = bitcast double* %160 to i64*
  store i64 0, i64* %161, align 8
  %indvars.iv.next117.prol = add nsw i64 %indvars.iv114, 1
  br label %.prol.loopexit126

.prol.loopexit126:                                ; preds = %.prol.preheader125, %.lr.ph21
  %indvars.iv116.unr.ph = phi i64 [ %indvars.iv.next117.prol, %.prol.preheader125 ], [ %indvars.iv114, %.lr.ph21 ]
  %162 = icmp eq i32 %154, 0
  br i1 %162, label %._crit_edge22, label %.lr.ph21.new.preheader

.lr.ph21.new.preheader:                           ; preds = %.prol.loopexit126
  br label %.lr.ph21.new

.lr.ph21.new:                                     ; preds = %.lr.ph21.new.preheader, %.lr.ph21.new
  %indvars.iv116 = phi i64 [ %indvars.iv.next117.1, %.lr.ph21.new ], [ %indvars.iv116.unr.ph, %.lr.ph21.new.preheader ]
  %163 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv129, i64 %indvars.iv116
  store double 0.000000e+00, double* %163, align 8
  %164 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv116, i64 %indvars.iv129
  %165 = bitcast double* %164 to i64*
  store i64 0, i64* %165, align 8
  %indvars.iv.next117 = add nsw i64 %indvars.iv116, 1
  %166 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv129, i64 %indvars.iv.next117
  store double 0.000000e+00, double* %166, align 8
  %167 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next117, i64 %indvars.iv129
  %168 = bitcast double* %167 to i64*
  store i64 0, i64* %168, align 8
  %indvars.iv.next117.1 = add nsw i64 %indvars.iv116, 2
  %lftr.wideiv122.1 = trunc i64 %indvars.iv.next117.1 to i32
  %exitcond123.1 = icmp eq i32 %lftr.wideiv122.1, %0
  br i1 %exitcond123.1, label %._crit_edge22.loopexit, label %.lr.ph21.new

._crit_edge22.loopexit:                           ; preds = %.lr.ph21.new
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge22.loopexit, %.prol.loopexit126, %.lr.ph28.split
  %169 = icmp slt i64 %indvars.iv.next130, %117
  %indvars.iv.next115 = add nsw i64 %indvars.iv114, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %169, label %.lr.ph28.split, label %._crit_edge29.loopexit177

._crit_edge29.loopexit:                           ; preds = %._crit_edge22.us-lcssa.us.us
  br label %._crit_edge29

._crit_edge29.loopexit177:                        ; preds = %._crit_edge22
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.loopexit177, %._crit_edge29.loopexit
  br label %170

; <label>:170:                                    ; preds = %._crit_edge29, %._crit_edge11
  %171 = sext i32 %111 to i64
  %172 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %171, i64 %171
  store double 1.000000e+00, double* %172, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
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
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge2.us ]
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
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
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
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

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
