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
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(i32 1400, double* nonnull %3, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  call fastcc void @kernel_covariance(i32 1200, i32 1400, double %8, [1200 x double]* %7, [1200 x double]* %9, double* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
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
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double*, [1200 x double]*) unnamed_addr #2 {
  store double 1.400000e+03, double* %1, align 8
  br label %.preheader

.preheader:                                       ; preds = %28, %3
  %indvars.iv4 = phi i64 [ 0, %3 ], [ %indvars.iv.next5, %28 ]
  %4 = trunc i64 %indvars.iv4 to i32
  %5 = sitofp i32 %4 to double
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1.1, %._crit_edge ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4, i64 %indvars.iv
  %11 = or i32 %8, 1
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %9, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fmul <2 x double> %7, %14
  %16 = fdiv <2 x double> %15, <double 1.200000e+03, double 1.200000e+03>
  %17 = bitcast double* %10 to <2 x double>*
  store <2 x double> %16, <2 x double>* %17, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %18 = trunc i64 %indvars.iv.next.1 to i32
  %19 = sitofp i32 %18 to double
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4, i64 %indvars.iv.next.1
  %21 = or i32 %18, 1
  %22 = sitofp i32 %21 to double
  %23 = insertelement <2 x double> undef, double %19, i32 0
  %24 = insertelement <2 x double> %23, double %22, i32 1
  %25 = fmul <2 x double> %7, %24
  %26 = fdiv <2 x double> %25, <double 1.200000e+03, double 1.200000e+03>
  %27 = bitcast double* %20 to <2 x double>*
  store <2 x double> %26, <2 x double>* %27, align 8
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 4
  %exitcond.1.1 = icmp eq i64 %indvars.iv.next.1.1, 1200
  br i1 %exitcond.1.1, label %28, label %._crit_edge

; <label>:28:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1400
  br i1 %exitcond6, label %29, label %.preheader

; <label>:29:                                     ; preds = %28
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_covariance(i32, i32, double, [1200 x double]*, [1200 x double]*, double*) unnamed_addr #2 {
.lr.ph44:
  %sunkaddr132 = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  br label %.lr.ph44.split.us

.lr.ph44.split.us:                                ; preds = %._crit_edge40.us, %.lr.ph44
  %indvars.iv99 = phi i64 [ 0, %.lr.ph44 ], [ %indvars.iv.next100, %._crit_edge40.us ]
  %6 = getelementptr inbounds double, double* %5, i64 %indvars.iv99
  store double 0.000000e+00, double* %6, align 8
  %sunkaddr133 = shl i64 %indvars.iv99, 3
  %sunkaddr134 = add i64 %sunkaddr132, %sunkaddr133
  %sunkaddr135 = inttoptr i64 %sunkaddr134 to double*
  br label %.lr.ph44.split.us.new

.lr.ph44.split.us.new:                            ; preds = %.lr.ph44.split.us.new, %.lr.ph44.split.us
  %7 = phi double [ 0.000000e+00, %.lr.ph44.split.us ], [ %19, %.lr.ph44.split.us.new ]
  %indvars.iv95 = phi i64 [ 0, %.lr.ph44.split.us ], [ %indvars.iv.next96.3, %.lr.ph44.split.us.new ]
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv95, i64 %indvars.iv99
  %9 = load double, double* %8, align 8
  %10 = fadd double %9, %7
  store double %10, double* %sunkaddr135, align 8
  %indvars.iv.next96 = or i64 %indvars.iv95, 1
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next96, i64 %indvars.iv99
  %12 = load double, double* %11, align 8
  %13 = fadd double %12, %10
  store double %13, double* %sunkaddr135, align 8
  %indvars.iv.next96.1 = or i64 %indvars.iv95, 2
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next96.1, i64 %indvars.iv99
  %15 = load double, double* %14, align 8
  %16 = fadd double %15, %13
  store double %16, double* %sunkaddr135, align 8
  %indvars.iv.next96.2 = or i64 %indvars.iv95, 3
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next96.2, i64 %indvars.iv99
  %18 = load double, double* %17, align 8
  %19 = fadd double %18, %16
  store double %19, double* %sunkaddr135, align 8
  %indvars.iv.next96.3 = add nsw i64 %indvars.iv95, 4
  %exitcond98.3 = icmp eq i64 %indvars.iv.next96.3, 1400
  br i1 %exitcond98.3, label %._crit_edge40.us, label %.lr.ph44.split.us.new

._crit_edge40.us:                                 ; preds = %.lr.ph44.split.us.new
  %20 = fdiv double %19, %2
  %sunkaddr218 = shl i64 %indvars.iv99, 3
  %sunkaddr219 = add i64 %sunkaddr, %sunkaddr218
  %sunkaddr220 = inttoptr i64 %sunkaddr219 to double*
  store double %20, double* %sunkaddr220, align 8
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %21 = icmp slt i64 %indvars.iv.next100, 1200
  br i1 %21, label %.lr.ph44.split.us, label %.preheader7.us.preheader

.preheader7.us.preheader:                         ; preds = %._crit_edge40.us
  %scevgep164 = getelementptr double, double* %5, i64 1200
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.preheader7.us.preheader, %._crit_edge33.us
  %indvars.iv93 = phi i64 [ %indvars.iv.next94, %._crit_edge33.us ], [ 0, %.preheader7.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv93, i64 0
  %scevgep159 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv93, i64 1200
  %bound0 = icmp ult double* %scevgep, %scevgep164
  %bound1 = icmp ugt double* %scevgep159, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.preheader7.us.new.preheader, label %vector.body151.preheader

vector.body151.preheader:                         ; preds = %.preheader7.us
  br label %vector.body151

.preheader7.us.new.preheader:                     ; preds = %.preheader7.us
  br label %.preheader7.us.new

vector.body151:                                   ; preds = %vector.body151.preheader, %vector.body151
  %index167 = phi i64 [ %index.next168, %vector.body151 ], [ 0, %vector.body151.preheader ]
  %22 = shl i64 %index167, 2
  %23 = getelementptr inbounds double, double* %5, i64 %22
  %24 = bitcast double* %23 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %24, align 8, !alias.scope !1
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv93, i64 %22
  %26 = bitcast double* %25 to <8 x double>*
  %wide.vec177 = load <8 x double>, <8 x double>* %26, align 8, !alias.scope !4, !noalias !1
  %27 = fsub <8 x double> %wide.vec177, %wide.vec
  %28 = shufflevector <8 x double> %27, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %29 = shufflevector <8 x double> %27, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %30 = shufflevector <8 x double> %27, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %31 = or i64 %22, 3
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv93, i64 %31
  %33 = shufflevector <8 x double> %27, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %34 = getelementptr double, double* %32, i64 -3
  %35 = bitcast double* %34 to <8 x double>*
  %36 = shufflevector <2 x double> %28, <2 x double> %29, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %37 = shufflevector <2 x double> %30, <2 x double> %33, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %36, <4 x double> %37, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %35, align 8, !alias.scope !4, !noalias !1
  %index.next168 = add i64 %index167, 2
  %38 = icmp eq i64 %index.next168, 300
  br i1 %38, label %._crit_edge33.us.loopexit221, label %vector.body151, !llvm.loop !6

.preheader7.us.new:                               ; preds = %.preheader7.us.new.preheader, %.preheader7.us.new
  %indvars.iv89 = phi i64 [ %indvars.iv.next90.3, %.preheader7.us.new ], [ 0, %.preheader7.us.new.preheader ]
  %39 = getelementptr inbounds double, double* %5, i64 %indvars.iv89
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv93, i64 %indvars.iv89
  %42 = load double, double* %41, align 8
  %43 = fsub double %42, %40
  store double %43, double* %41, align 8
  %indvars.iv.next90 = or i64 %indvars.iv89, 1
  %44 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next90
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv93, i64 %indvars.iv.next90
  %47 = load double, double* %46, align 8
  %48 = fsub double %47, %45
  store double %48, double* %46, align 8
  %indvars.iv.next90.1 = or i64 %indvars.iv89, 2
  %49 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next90.1
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv93, i64 %indvars.iv.next90.1
  %52 = load double, double* %51, align 8
  %53 = fsub double %52, %50
  store double %53, double* %51, align 8
  %indvars.iv.next90.2 = or i64 %indvars.iv89, 3
  %54 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next90.2
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv93, i64 %indvars.iv.next90.2
  %57 = load double, double* %56, align 8
  %58 = fsub double %57, %55
  store double %58, double* %56, align 8
  %indvars.iv.next90.3 = add nsw i64 %indvars.iv89, 4
  %exitcond92.3 = icmp eq i64 %indvars.iv.next90.3, 1200
  br i1 %exitcond92.3, label %._crit_edge33.us.loopexit, label %.preheader7.us.new, !llvm.loop !9

._crit_edge33.us.loopexit:                        ; preds = %.preheader7.us.new
  br label %._crit_edge33.us

._crit_edge33.us.loopexit221:                     ; preds = %vector.body151
  br label %._crit_edge33.us

._crit_edge33.us:                                 ; preds = %._crit_edge33.us.loopexit221, %._crit_edge33.us.loopexit
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %59 = icmp slt i64 %indvars.iv.next94, 1400
  br i1 %59, label %.preheader7.us, label %.lr.ph15

.lr.ph15:                                         ; preds = %._crit_edge33.us
  %60 = fadd double %2, -1.000000e+00
  br label %.lr.ph15.split.us..lr.ph.us.us_crit_edge

.lr.ph15.split.us..lr.ph.us.us_crit_edge:         ; preds = %.lr.ph15, %._crit_edge11.us-lcssa.us.us
  %indvars.iv73 = phi i64 [ 0, %.lr.ph15 ], [ %indvars.iv.next74, %._crit_edge11.us-lcssa.us.us ]
  br label %.lr.ph.us.us

._crit_edge11.us-lcssa.us.us:                     ; preds = %._crit_edge.us.us
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %61 = icmp slt i64 %indvars.iv.next74, 1200
  br i1 %61, label %.lr.ph15.split.us..lr.ph.us.us_crit_edge, label %.preheader._crit_edge

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph15.split.us..lr.ph.us.us_crit_edge
  %indvars.iv66 = phi i64 [ %indvars.iv73, %.lr.ph15.split.us..lr.ph.us.us_crit_edge ], [ %indvars.iv.next67, %._crit_edge.us.us ]
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv73, i64 %indvars.iv66
  store double 0.000000e+00, double* %62, align 8
  br label %.lr.ph.us.us.new

._crit_edge.us.us:                                ; preds = %.lr.ph.us.us.new
  %63 = fdiv double %77, %60
  store double %63, double* %62, align 8
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 %indvars.iv73
  store double %63, double* %64, align 8
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next67 to i32
  %exitcond72 = icmp eq i32 %lftr.wideiv, 1200
  br i1 %exitcond72, label %._crit_edge11.us-lcssa.us.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new, %.lr.ph.us.us
  %65 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %77, %.lr.ph.us.us.new ]
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %.lr.ph.us.us.new ]
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv73
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv66
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = fadd double %70, %65
  store double %71, double* %62, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv73
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv66
  %75 = load double, double* %74, align 8
  %76 = fmul double %73, %75
  %77 = fadd double %76, %71
  store double %77, double* %62, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge.us.us, label %.lr.ph.us.us.new

.preheader._crit_edge:                            ; preds = %._crit_edge11.us-lcssa.us.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]*) unnamed_addr #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv9 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next10, %._crit_edge.us ]
  %6 = mul nsw i64 %indvars.iv9, 1200
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge11, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge11 ]
  %7 = add nsw i64 %6, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge11

; <label>:11:                                     ; preds = %._crit_edge12
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge12, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv9, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge12

._crit_edge.us:                                   ; preds = %._crit_edge11
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %17 = icmp slt i64 %indvars.iv.next10, 1200
  br i1 %17, label %.preheader.us, label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
