; ModuleID = 'A.ll'
source_filename = "covariance.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"cov\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #3
  %7 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(i32 1400, double* nonnull %3, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #3
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  call fastcc void @kernel_covariance(i32 1200, i32 1400, double %8, [1200 x double]* %7, [1200 x double]* %9, double* %10)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array(i32 1200, [1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %4) #3
  call void @free(i8* %5) #3
  call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, double*, [1200 x double]*) unnamed_addr #0 {
  store double 1.400000e+03, double* %1, align 8
  br label %.preheader

.preheader:                                       ; preds = %19, %3
  %indvars.iv5 = phi i64 [ 0, %3 ], [ %indvars.iv.next6, %19 ]
  %4 = trunc i64 %indvars.iv5 to i32
  %5 = sitofp i32 %4 to double
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv5, i64 %indvars.iv
  %11 = trunc i64 %indvars.iv to i32
  %12 = or i32 %11, 1
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fmul <2 x double> %15, %7
  %17 = fdiv <2 x double> %16, <double 1.200000e+03, double 1.200000e+03>
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1400
  br i1 %exitcond7, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_covariance(i32, i32, double, [1200 x double]*, [1200 x double]*, double*) unnamed_addr #0 {
.lr.ph53:
  %sunkaddr132 = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  %sunkaddr221 = ptrtoint double* %5 to i64
  br label %.lr.ph53.split.us

.lr.ph53.split.us:                                ; preds = %._crit_edge48.us, %.lr.ph53
  %indvars.iv95 = phi i64 [ 0, %.lr.ph53 ], [ %indvars.iv.next96, %._crit_edge48.us ]
  %sext116 = shl i64 %indvars.iv95, 32
  %6 = ashr exact i64 %sext116, 32
  %7 = getelementptr inbounds double, double* %5, i64 %6
  store double 0.000000e+00, double* %7, align 8
  %sunkaddr133 = shl i64 %indvars.iv95, 3
  %sunkaddr134 = add i64 %sunkaddr132, %sunkaddr133
  %sunkaddr135 = inttoptr i64 %sunkaddr134 to double*
  %.pre118 = load double, double* %sunkaddr135, align 8
  %sunkaddr218 = shl i64 %indvars.iv95, 3
  %sunkaddr219 = add i64 %sunkaddr, %sunkaddr218
  %sunkaddr220 = inttoptr i64 %sunkaddr219 to double*
  br label %.lr.ph53.split.us.new

.lr.ph53.split.us.new:                            ; preds = %.lr.ph53.split.us.new, %.lr.ph53.split.us
  %8 = phi double [ %.pre118, %.lr.ph53.split.us ], [ %20, %.lr.ph53.split.us.new ]
  %indvars.iv91 = phi i64 [ 0, %.lr.ph53.split.us ], [ %indvars.iv.next92.3, %.lr.ph53.split.us.new ]
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv91, i64 %indvars.iv95
  %10 = load double, double* %9, align 8
  %11 = fadd double %10, %8
  store double %11, double* %sunkaddr220, align 8
  %indvars.iv.next92 = or i64 %indvars.iv91, 1
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next92, i64 %indvars.iv95
  %13 = load double, double* %12, align 8
  %14 = fadd double %13, %11
  store double %14, double* %sunkaddr220, align 8
  %indvars.iv.next92.1 = or i64 %indvars.iv91, 2
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next92.1, i64 %indvars.iv95
  %16 = load double, double* %15, align 8
  %17 = fadd double %16, %14
  store double %17, double* %sunkaddr220, align 8
  %indvars.iv.next92.2 = or i64 %indvars.iv91, 3
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next92.2, i64 %indvars.iv95
  %19 = load double, double* %18, align 8
  %20 = fadd double %19, %17
  store double %20, double* %sunkaddr220, align 8
  %indvars.iv.next92.3 = add nsw i64 %indvars.iv91, 4
  %exitcond94.3 = icmp eq i64 %indvars.iv.next92.3, 1400
  br i1 %exitcond94.3, label %._crit_edge48.us, label %.lr.ph53.split.us.new

._crit_edge48.us:                                 ; preds = %.lr.ph53.split.us.new
  %21 = fdiv double %20, %2
  %sunkaddr222 = shl i64 %indvars.iv95, 3
  %sunkaddr223 = add i64 %sunkaddr221, %sunkaddr222
  %sunkaddr224 = inttoptr i64 %sunkaddr223 to double*
  store double %21, double* %sunkaddr224, align 8
  %indvars.iv.next96 = add nsw i64 %indvars.iv95, 1
  %22 = icmp slt i64 %indvars.iv.next96, 1200
  br i1 %22, label %.lr.ph53.split.us, label %.preheader8.us.preheader

.preheader8.us.preheader:                         ; preds = %._crit_edge48.us
  %scevgep166 = getelementptr double, double* %5, i64 1200
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %.preheader8.us.preheader, %._crit_edge38.us
  %indvars.iv89 = phi i64 [ %indvars.iv.next90, %._crit_edge38.us ], [ 0, %.preheader8.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv89, i64 0
  %scevgep161 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv89, i64 1200
  %bound0 = icmp ult double* %scevgep, %scevgep166
  %bound1 = icmp ugt double* %scevgep161, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.preheader8.us.new.preheader, label %vector.body153.preheader

vector.body153.preheader:                         ; preds = %.preheader8.us
  br label %vector.body153

.preheader8.us.new.preheader:                     ; preds = %.preheader8.us
  br label %.preheader8.us.new

vector.body153:                                   ; preds = %vector.body153.preheader, %vector.body153
  %index169 = phi i64 [ %index.next170, %vector.body153 ], [ 0, %vector.body153.preheader ]
  %23 = shl i64 %index169, 2
  %24 = getelementptr inbounds double, double* %5, i64 %23
  %25 = bitcast double* %24 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %25, align 8, !alias.scope !1
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv89, i64 %23
  %27 = bitcast double* %26 to <8 x double>*
  %wide.vec179 = load <8 x double>, <8 x double>* %27, align 8, !alias.scope !4, !noalias !1
  %28 = fsub <8 x double> %wide.vec179, %wide.vec
  %29 = shufflevector <8 x double> %28, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %30 = shufflevector <8 x double> %28, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %31 = shufflevector <8 x double> %28, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %32 = or i64 %23, 3
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv89, i64 %32
  %34 = shufflevector <8 x double> %28, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %35 = getelementptr double, double* %33, i64 -3
  %36 = bitcast double* %35 to <8 x double>*
  %37 = shufflevector <2 x double> %29, <2 x double> %30, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %38 = shufflevector <2 x double> %31, <2 x double> %34, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %37, <4 x double> %38, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %36, align 8, !alias.scope !4, !noalias !1
  %index.next170 = add i64 %index169, 2
  %39 = icmp eq i64 %index.next170, 300
  br i1 %39, label %._crit_edge38.us.loopexit225, label %vector.body153, !llvm.loop !6

.preheader8.us.new:                               ; preds = %.preheader8.us.new.preheader, %.preheader8.us.new
  %indvars.iv85 = phi i64 [ %indvars.iv.next86.3, %.preheader8.us.new ], [ 0, %.preheader8.us.new.preheader ]
  %40 = getelementptr inbounds double, double* %5, i64 %indvars.iv85
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv89, i64 %indvars.iv85
  %43 = load double, double* %42, align 8
  %44 = fsub double %43, %41
  store double %44, double* %42, align 8
  %indvars.iv.next86 = or i64 %indvars.iv85, 1
  %45 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next86
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv89, i64 %indvars.iv.next86
  %48 = load double, double* %47, align 8
  %49 = fsub double %48, %46
  store double %49, double* %47, align 8
  %indvars.iv.next86.1 = or i64 %indvars.iv85, 2
  %50 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next86.1
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv89, i64 %indvars.iv.next86.1
  %53 = load double, double* %52, align 8
  %54 = fsub double %53, %51
  store double %54, double* %52, align 8
  %indvars.iv.next86.2 = or i64 %indvars.iv85, 3
  %55 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next86.2
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv89, i64 %indvars.iv.next86.2
  %58 = load double, double* %57, align 8
  %59 = fsub double %58, %56
  store double %59, double* %57, align 8
  %indvars.iv.next86.3 = add nsw i64 %indvars.iv85, 4
  %exitcond88.3 = icmp eq i64 %indvars.iv.next86.3, 1200
  br i1 %exitcond88.3, label %._crit_edge38.us.loopexit, label %.preheader8.us.new, !llvm.loop !9

._crit_edge38.us.loopexit:                        ; preds = %.preheader8.us.new
  br label %._crit_edge38.us

._crit_edge38.us.loopexit225:                     ; preds = %vector.body153
  br label %._crit_edge38.us

._crit_edge38.us:                                 ; preds = %._crit_edge38.us.loopexit225, %._crit_edge38.us.loopexit
  %indvars.iv.next90 = add nsw i64 %indvars.iv89, 1
  %60 = icmp slt i64 %indvars.iv.next90, 1400
  br i1 %60, label %.preheader8.us, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %._crit_edge38.us
  %61 = fadd double %2, -1.000000e+00
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge13.us-lcssa.us.us, %.preheader.lr.ph
  %indvars.iv77 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next78, %._crit_edge13.us-lcssa.us.us ]
  %storemerge218.us = phi i32 [ 0, %.preheader.lr.ph ], [ %64, %._crit_edge13.us-lcssa.us.us ]
  %62 = icmp slt i32 %storemerge218.us, 1200
  br i1 %62, label %.lr.ph12.us, label %._crit_edge13.us-lcssa.us.us

._crit_edge13.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge.us.us
  br label %._crit_edge13.us-lcssa.us.us

._crit_edge13.us-lcssa.us.us:                     ; preds = %._crit_edge13.us-lcssa.us.us.loopexit, %.preheader.us
  %indvars.iv.next78 = add nsw i64 %indvars.iv77, 1
  %63 = icmp slt i64 %indvars.iv.next78, 1200
  %64 = trunc i64 %indvars.iv.next78 to i32
  br i1 %63, label %.preheader.us, label %.preheader7._crit_edge

.lr.ph12.us:                                      ; preds = %.preheader.us
  %65 = sext i32 %storemerge218.us to i64
  br label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph12.us
  %indvars.iv73 = phi i64 [ %65, %.lr.ph12.us ], [ %indvars.iv.next74, %._crit_edge.us.us ]
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv77, i64 %indvars.iv73
  store double 0.000000e+00, double* %66, align 8
  br label %.lr.ph.us.us.new

._crit_edge.us.us:                                ; preds = %.lr.ph.us.us.new
  %67 = fdiv double %81, %61
  store double %67, double* %66, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv73, i64 %indvars.iv77
  store double %67, double* %68, align 8
  %indvars.iv.next74 = add nsw i64 %indvars.iv73, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next74, 1200
  br i1 %exitcond76, label %._crit_edge13.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new, %.lr.ph.us.us
  %69 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %81, %.lr.ph.us.us.new ]
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %.lr.ph.us.us.new ]
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv77
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv73
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fadd double %74, %69
  store double %75, double* %66, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv77
  %77 = load double, double* %76, align 8
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv73
  %79 = load double, double* %78, align 8
  %80 = fmul double %77, %79
  %81 = fadd double %80, %75
  store double %81, double* %66, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge.us.us, label %.lr.ph.us.us.new

.preheader7._crit_edge:                           ; preds = %._crit_edge13.us-lcssa.us.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]*) unnamed_addr #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv11 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us ]
  %6 = mul nsw i64 %indvars.iv11, 1200
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge13, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge13 ]
  %7 = add nsw i64 %6, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge13

; <label>:11:                                     ; preds = %._crit_edge14
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #4
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge14, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv11, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge14

._crit_edge.us:                                   ; preds = %._crit_edge13
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %17 = icmp slt i64 %indvars.iv.next12, 1200
  br i1 %17, label %.preheader.us, label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
