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
  call fastcc void @print_array(i32 1200, [1200 x double]* %9)
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
  %indvars.iv4 = phi i64 [ 0, %3 ], [ %indvars.iv.next5, %19 ]
  %4 = trunc i64 %indvars.iv4 to i32
  %5 = sitofp i32 %4 to double
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4, i64 %indvars.iv
  %11 = trunc i64 %indvars.iv to i32
  %12 = or i32 %11, 1
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fmul <2 x double> %7, %15
  %17 = fdiv <2 x double> %16, <double 1.200000e+03, double 1.200000e+03>
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1400
  br i1 %exitcond6, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_covariance(i32, i32, double, [1200 x double]*, [1200 x double]*, double*) unnamed_addr #0 {
.lr.ph44.split.us.preheader:
  %sunkaddr = ptrtoint double* %5 to i64
  br label %.lr.ph44.split.us

.lr.ph44.split.us:                                ; preds = %._crit_edge40.us, %.lr.ph44.split.us.preheader
  %indvars.iv79 = phi i64 [ 0, %.lr.ph44.split.us.preheader ], [ %indvars.iv.next80, %._crit_edge40.us ]
  %6 = getelementptr inbounds double, double* %5, i64 %indvars.iv79
  store double 0.000000e+00, double* %6, align 8
  %sunkaddr90 = shl i64 %indvars.iv79, 3
  %sunkaddr91 = add i64 %sunkaddr, %sunkaddr90
  %sunkaddr92 = inttoptr i64 %sunkaddr91 to double*
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph44.split.us
  %indvars.iv76 = phi i64 [ 0, %.lr.ph44.split.us ], [ %indvars.iv.next77.4, %._crit_edge ]
  %7 = phi double [ 0.000000e+00, %.lr.ph44.split.us ], [ %22, %._crit_edge ]
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv76, i64 %indvars.iv79
  %9 = load double, double* %8, align 8
  %10 = fadd double %9, %7
  store double %10, double* %sunkaddr92, align 8
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next77, i64 %indvars.iv79
  %12 = load double, double* %11, align 8
  %13 = fadd double %12, %10
  store double %13, double* %sunkaddr92, align 8
  %indvars.iv.next77.1 = add nsw i64 %indvars.iv76, 2
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next77.1, i64 %indvars.iv79
  %15 = load double, double* %14, align 8
  %16 = fadd double %15, %13
  store double %16, double* %sunkaddr92, align 8
  %indvars.iv.next77.2 = add nsw i64 %indvars.iv76, 3
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next77.2, i64 %indvars.iv79
  %18 = load double, double* %17, align 8
  %19 = fadd double %18, %16
  store double %19, double* %sunkaddr92, align 8
  %indvars.iv.next77.3 = add nsw i64 %indvars.iv76, 4
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next77.3, i64 %indvars.iv79
  %21 = load double, double* %20, align 8
  %22 = fadd double %21, %19
  store double %22, double* %sunkaddr92, align 8
  %indvars.iv.next77.4 = add nsw i64 %indvars.iv76, 5
  %exitcond78.4 = icmp eq i64 %indvars.iv.next77.4, 1400
  br i1 %exitcond78.4, label %._crit_edge40.us, label %._crit_edge

._crit_edge40.us:                                 ; preds = %._crit_edge
  %23 = fdiv double %22, %2
  %sunkaddr114 = shl i64 %indvars.iv79, 3
  %sunkaddr115 = add i64 %sunkaddr, %sunkaddr114
  %sunkaddr116 = inttoptr i64 %sunkaddr115 to double*
  store double %23, double* %sunkaddr116, align 8
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next80, 1200
  br i1 %exitcond81, label %._crit_edge40.us..preheader7.us_crit_edge, label %.lr.ph44.split.us

._crit_edge40.us..preheader7.us_crit_edge:        ; preds = %._crit_edge40.us
  %scevgep101 = getelementptr double, double* %5, i64 1200
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge33.us, %._crit_edge40.us..preheader7.us_crit_edge
  %indvars.iv72 = phi i64 [ 0, %._crit_edge40.us..preheader7.us_crit_edge ], [ %24, %._crit_edge33.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv72, i64 0
  %24 = add i64 %indvars.iv72, 1
  %scevgep99 = getelementptr [1200 x double], [1200 x double]* %3, i64 %24, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep101
  %bound1 = icmp ugt double* %scevgep99, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge86.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader7.us
  br label %vector.body

._crit_edge86.preheader:                          ; preds = %.preheader7.us
  br label %._crit_edge86

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = shl i64 %index, 2
  %25 = getelementptr inbounds double, double* %5, i64 %offset.idx
  %26 = bitcast double* %25 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %26, align 8, !alias.scope !1
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv72, i64 %offset.idx
  %28 = bitcast double* %27 to <8 x double>*
  %wide.vec106 = load <8 x double>, <8 x double>* %28, align 8, !alias.scope !4, !noalias !1
  %29 = fsub <8 x double> %wide.vec106, %wide.vec
  %30 = shufflevector <8 x double> %29, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %31 = shufflevector <8 x double> %29, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %32 = shufflevector <8 x double> %29, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %33 = or i64 %offset.idx, 3
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv72, i64 %33
  %35 = shufflevector <8 x double> %29, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %36 = getelementptr double, double* %34, i64 -3
  %37 = bitcast double* %36 to <8 x double>*
  %38 = shufflevector <2 x double> %30, <2 x double> %31, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %39 = shufflevector <2 x double> %32, <2 x double> %35, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %38, <4 x double> %39, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %37, align 8, !alias.scope !4, !noalias !1
  %index.next = add i64 %index, 2
  %40 = icmp eq i64 %index.next, 300
  br i1 %40, label %._crit_edge33.us.loopexit117, label %vector.body, !llvm.loop !6

._crit_edge86:                                    ; preds = %._crit_edge86.preheader, %._crit_edge86
  %indvars.iv69 = phi i64 [ %indvars.iv.next70.3, %._crit_edge86 ], [ 0, %._crit_edge86.preheader ]
  %41 = getelementptr inbounds double, double* %5, i64 %indvars.iv69
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv72, i64 %indvars.iv69
  %44 = load double, double* %43, align 8
  %45 = fsub double %44, %42
  store double %45, double* %43, align 8
  %indvars.iv.next70 = or i64 %indvars.iv69, 1
  %46 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next70
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv72, i64 %indvars.iv.next70
  %49 = load double, double* %48, align 8
  %50 = fsub double %49, %47
  store double %50, double* %48, align 8
  %indvars.iv.next70.1 = or i64 %indvars.iv69, 2
  %51 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next70.1
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv72, i64 %indvars.iv.next70.1
  %54 = load double, double* %53, align 8
  %55 = fsub double %54, %52
  store double %55, double* %53, align 8
  %indvars.iv.next70.2 = or i64 %indvars.iv69, 3
  %56 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next70.2
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv72, i64 %indvars.iv.next70.2
  %59 = load double, double* %58, align 8
  %60 = fsub double %59, %57
  store double %60, double* %58, align 8
  %indvars.iv.next70.3 = add nsw i64 %indvars.iv69, 4
  %exitcond71.3 = icmp eq i64 %indvars.iv.next70.3, 1200
  br i1 %exitcond71.3, label %._crit_edge33.us.loopexit, label %._crit_edge86, !llvm.loop !9

._crit_edge33.us.loopexit:                        ; preds = %._crit_edge86
  br label %._crit_edge33.us

._crit_edge33.us.loopexit117:                     ; preds = %vector.body
  br label %._crit_edge33.us

._crit_edge33.us:                                 ; preds = %._crit_edge33.us.loopexit117, %._crit_edge33.us.loopexit
  %exitcond74 = icmp eq i64 %24, 1400
  br i1 %exitcond74, label %.lr.ph15.split.us.preheader, label %.preheader7.us

.lr.ph15.split.us.preheader:                      ; preds = %._crit_edge33.us
  %61 = fadd double %2, -1.000000e+00
  br label %.lr.ph10.us

._crit_edge11.us-lcssa.us.us:                     ; preds = %._crit_edge.us.us
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next59, 1200
  br i1 %exitcond60, label %._crit_edge16, label %.lr.ph10.us

.lr.ph10.us:                                      ; preds = %._crit_edge11.us-lcssa.us.us, %.lr.ph15.split.us.preheader
  %indvars.iv58 = phi i64 [ 0, %.lr.ph15.split.us.preheader ], [ %indvars.iv.next59, %._crit_edge11.us-lcssa.us.us ]
  br label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph10.us
  %indvars.iv55 = phi i64 [ %indvars.iv58, %.lr.ph10.us ], [ %indvars.iv.next56, %._crit_edge.us.us ]
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %indvars.iv55
  store double 0.000000e+00, double* %62, align 8
  br label %._crit_edge87

._crit_edge.us.us:                                ; preds = %._crit_edge87
  %63 = fdiv double %77, %61
  store double %63, double* %62, align 8
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv55, i64 %indvars.iv58
  store double %63, double* %64, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next56, 1200
  br i1 %exitcond57, label %._crit_edge11.us-lcssa.us.us, label %.lr.ph.us.us

._crit_edge87:                                    ; preds = %._crit_edge87, %.lr.ph.us.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %._crit_edge87 ]
  %65 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %77, %._crit_edge87 ]
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv58
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv55
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = fadd double %70, %65
  store double %71, double* %62, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv58
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv55
  %75 = load double, double* %74, align 8
  %76 = fmul double %73, %75
  %77 = fadd double %76, %71
  store double %77, double* %62, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge.us.us, label %._crit_edge87

._crit_edge16:                                    ; preds = %._crit_edge11.us-lcssa.us.us
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
  %indvars.iv7 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next8, %._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv7, 1200
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %6, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge10, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv7, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge10

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1200
  br i1 %exitcond9, label %._crit_edge3, label %.preheader.us

._crit_edge3:                                     ; preds = %._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #4
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
