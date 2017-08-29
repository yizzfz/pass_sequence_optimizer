; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %4 = call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %5 = call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %6 = call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  call fastcc void @init_array([2000 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_start() #5
  call fastcc void @kernel_ludcmp([2000 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_stop() #5
  call void (...) @polybench_timer_print() #5
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to double*
  call fastcc void @print_array(double* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %3) #5
  call void @free(i8* %4) #5
  call void @free(i8* %5) #5
  call void @free(i8* %6) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]*, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
.lr.ph57:
  %4 = alloca [2000 x double]*, align 8
  %5 = alloca [2000 x [2000 x double]]*, align 8
  store [2000 x double]* %0, [2000 x double]** %4, align 8
  br label %._crit_edge69

._crit_edge69:                                    ; preds = %._crit_edge69, %.lr.ph57
  %indvars.iv131 = phi i64 [ 0, %.lr.ph57 ], [ %indvars.iv.next132.1, %._crit_edge69 ]
  %6 = getelementptr inbounds double, double* %2, i64 %indvars.iv131
  %7 = bitcast double* %6 to <2 x double>*
  %8 = getelementptr inbounds double, double* %3, i64 %indvars.iv131
  %9 = bitcast double* %8 to <2 x double>*
  %indvars.iv.next132 = or i64 %indvars.iv131, 1
  %10 = trunc i64 %indvars.iv.next132 to i32
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv131
  store <2 x double> zeroinitializer, <2 x double>* %7, align 8
  store <2 x double> zeroinitializer, <2 x double>* %9, align 8
  %indvars.iv.next132.1 = add nsw i64 %indvars.iv131, 2
  %13 = trunc i64 %indvars.iv.next132.1 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %11, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 2.000000e+03, double 2.000000e+03>
  %18 = fmul <2 x double> %17, <double 5.000000e-01, double 5.000000e-01>
  %19 = fadd <2 x double> %18, <double 4.000000e+00, double 4.000000e+00>
  %20 = bitcast double* %12 to <2 x double>*
  store <2 x double> %19, <2 x double>* %20, align 8
  %exitcond142.1 = icmp eq i64 %indvars.iv.next132, 1999
  br i1 %exitcond142.1, label %.lr.ph50.preheader, label %._crit_edge69

.lr.ph50.preheader:                               ; preds = %._crit_edge69
  br label %.lr.ph50

.lr.ph50:                                         ; preds = %.lr.ph50.preheader, %._crit_edge46._crit_edge
  %indvars.iv129 = phi i64 [ %indvars.iv.next130, %._crit_edge46._crit_edge ], [ 0, %.lr.ph50.preheader ]
  %indvars.iv116 = phi i32 [ %indvars.iv.next117, %._crit_edge46._crit_edge ], [ 0, %.lr.ph50.preheader ]
  %indvars.iv.next130 = add i64 %indvars.iv129, 1
  %sext = shl i64 %indvars.iv.next130, 32
  %21 = ashr exact i64 %sext, 32
  %scevgep127 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv129, i64 %21
  %22 = sub i64 1998, %indvars.iv129
  %23 = shl i64 %22, 3
  %24 = and i64 %23, 34359738360
  %25 = add nuw nsw i64 %24, 8
  %26 = icmp sgt i64 %indvars.iv129, -1
  br i1 %26, label %..lr.ph40_crit_edge, label %._crit_edge41

..lr.ph40_crit_edge:                              ; preds = %.lr.ph50
  %wide.trip.count118 = zext i32 %indvars.iv116 to i64
  br label %.lr.ph40

.lr.ph40:                                         ; preds = %.lr.ph40, %..lr.ph40_crit_edge
  %indvars.iv112 = phi i64 [ %indvars.iv.next113, %.lr.ph40 ], [ 0, %..lr.ph40_crit_edge ]
  %27 = sub nsw i64 0, %indvars.iv112
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 2000
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 2.000000e+03
  %32 = fadd double %31, 1.000000e+00
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv129, i64 %indvars.iv112
  store double %32, double* %33, align 8
  %exitcond119 = icmp eq i64 %indvars.iv112, %wide.trip.count118
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  br i1 %exitcond119, label %._crit_edge41.loopexit, label %.lr.ph40

._crit_edge41.loopexit:                           ; preds = %.lr.ph40
  br label %._crit_edge41

._crit_edge41:                                    ; preds = %._crit_edge41.loopexit, %.lr.ph50
  %34 = icmp slt i64 %indvars.iv.next130, 2000
  br i1 %34, label %._crit_edge46._crit_edge, label %._crit_edge70

._crit_edge46._crit_edge:                         ; preds = %._crit_edge41
  %35 = bitcast double* %scevgep127 to i8*
  call void @llvm.memset.p0i8.i64(i8* %35, i8 0, i64 %25, i32 8, i1 false)
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv129, i64 %indvars.iv129
  store double 1.000000e+00, double* %36, align 8
  %indvars.iv.next117 = add i32 %indvars.iv116, 1
  br label %.lr.ph50

._crit_edge70:                                    ; preds = %._crit_edge41
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv129, i64 %indvars.iv129
  store double 1.000000e+00, double* %37, align 8
  %38 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %39 = bitcast [2000 x [2000 x double]]** %5 to i8**
  store i8* %38, i8** %39, align 8
  br label %.lr.ph33.split.us

.lr.ph33.split.us:                                ; preds = %.lr.ph33.split.us, %._crit_edge70
  %indvars.iv109 = phi i64 [ 0, %._crit_edge70 ], [ %indvars.iv.next110.7, %.lr.ph33.split.us ]
  %40 = bitcast i8* %38 to [2000 x [2000 x double]]*
  %41 = bitcast i8* %38 to [2000 x [2000 x double]]*
  %42 = bitcast i8* %38 to [2000 x [2000 x double]]*
  %43 = bitcast i8* %38 to [2000 x [2000 x double]]*
  %44 = bitcast i8* %38 to [2000 x [2000 x double]]*
  %45 = bitcast i8* %38 to [2000 x [2000 x double]]*
  %46 = bitcast i8* %38 to [2000 x [2000 x double]]*
  %47 = bitcast i8* %38 to [2000 x [2000 x double]]*
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv109, i64 0
  %scevgep108 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next110 = or i64 %indvars.iv109, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvars.iv.next110, i64 0
  %scevgep108.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next110.1 = or i64 %indvars.iv109, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %45, i64 0, i64 %indvars.iv.next110.1, i64 0
  %scevgep108.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next110.2 = or i64 %indvars.iv109, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %44, i64 0, i64 %indvars.iv.next110.2, i64 0
  %scevgep108.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next110.3 = or i64 %indvars.iv109, 4
  %scevgep.4 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %43, i64 0, i64 %indvars.iv.next110.3, i64 0
  %scevgep108.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next110.4 = or i64 %indvars.iv109, 5
  %scevgep.5 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %indvars.iv.next110.4, i64 0
  %scevgep108.5 = bitcast double* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next110.5 = or i64 %indvars.iv109, 6
  %scevgep.6 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv.next110.5, i64 0
  %scevgep108.6 = bitcast double* %scevgep.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next110.6 = or i64 %indvars.iv109, 7
  %scevgep.7 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv.next110.6, i64 0
  %scevgep108.7 = bitcast double* %scevgep.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next110.7 = add nsw i64 %indvars.iv109, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next110.6, 1999
  br i1 %exitcond.7, label %.lr.ph20.split.us, label %.lr.ph33.split.us

.lr.ph20.split.us:                                ; preds = %.lr.ph33.split.us
  br label %.lr.ph13.us..lr.ph9.us.us_crit_edge

.lr.ph13.us..lr.ph9.us.us_crit_edge:              ; preds = %._crit_edge14.us, %.lr.ph20.split.us
  %indvars.iv103 = phi i64 [ 0, %.lr.ph20.split.us ], [ %48, %._crit_edge14.us ]
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv103
  %48 = add nuw nsw i64 %indvars.iv103, 1
  %scevgep7 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %48
  br label %vector.memcheck

._crit_edge14.us:                                 ; preds = %._crit_edge10.us.us
  %exitcond50 = icmp eq i64 %48, 2000
  br i1 %exitcond50, label %.lr.ph2..lr.ph2.split.us_crit_edge, label %.lr.ph13.us..lr.ph9.us.us_crit_edge

scalar.ph.preheader:                              ; preds = %vector.memcheck
  br label %scalar.ph

vector.memcheck:                                  ; preds = %._crit_edge10.us.us, %.lr.ph13.us..lr.ph9.us.us_crit_edge
  %indvars.iv101 = phi i64 [ 0, %.lr.ph13.us..lr.ph9.us.us_crit_edge ], [ %indvars.iv.next102, %._crit_edge10.us.us ]
  %49 = bitcast i8* %38 to [2000 x [2000 x double]]*
  %scevgep1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv101, i64 0
  %scevgep3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv101, i64 2000
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv101, i64 %indvars.iv103
  %bound0 = icmp ult double* %scevgep1, %scevgep7
  %bound1 = icmp ult double* %scevgep5, %scevgep3
  %found.conflict = and i1 %bound0, %bound1
  %bound010 = icmp ult double* %scevgep1, %50
  %bound111 = icmp ult double* %50, %scevgep3
  %found.conflict12 = and i1 %bound010, %bound111
  %conflict.rdx = or i1 %found.conflict, %found.conflict12
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %51 = bitcast i8* %38 to [2000 x [2000 x double]]*
  %52 = or i64 %index, 1
  %53 = or i64 %index, 2
  %54 = or i64 %index, 3
  %55 = load double, double* %50, align 8, !alias.scope !1
  %56 = insertelement <2 x double> undef, double %55, i32 0
  %57 = shufflevector <2 x double> %56, <2 x double> undef, <2 x i32> zeroinitializer
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv103
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %52, i64 %indvars.iv103
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %53, i64 %indvars.iv103
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %54, i64 %indvars.iv103
  %62 = load double, double* %58, align 8, !alias.scope !4
  %63 = load double, double* %59, align 8, !alias.scope !4
  %64 = load double, double* %60, align 8, !alias.scope !4
  %65 = load double, double* %61, align 8, !alias.scope !4
  %66 = insertelement <2 x double> undef, double %62, i32 0
  %67 = insertelement <2 x double> %66, double %63, i32 1
  %68 = insertelement <2 x double> undef, double %64, i32 0
  %69 = insertelement <2 x double> %68, double %65, i32 1
  %70 = fmul <2 x double> %57, %67
  %71 = fmul <2 x double> %57, %69
  %72 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv101, i64 %index
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !6, !noalias !8
  %74 = getelementptr double, double* %72, i64 2
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !6, !noalias !8
  %76 = fadd <2 x double> %70, %wide.load
  %77 = fadd <2 x double> %71, %wide.load14
  store <2 x double> %76, <2 x double>* %73, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %77, <2 x double>* %75, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %78 = icmp eq i64 %index.next, 2000
  br i1 %78, label %middle.block, label %vector.body, !llvm.loop !9

middle.block:                                     ; preds = %vector.body
  br label %._crit_edge10.us.us

._crit_edge10.us.us.loopexit:                     ; preds = %scalar.ph
  br label %._crit_edge10.us.us

._crit_edge10.us.us:                              ; preds = %._crit_edge10.us.us.loopexit, %middle.block
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next102, 2000
  br i1 %exitcond49, label %._crit_edge14.us, label %vector.memcheck

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv97 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next98.1, %scalar.ph ]
  %79 = bitcast i8* %38 to [2000 x [2000 x double]]*
  %80 = load double, double* %50, align 8
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv97, i64 %indvars.iv103
  %82 = load double, double* %81, align 8
  %83 = fmul double %80, %82
  %84 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %79, i64 0, i64 %indvars.iv101, i64 %indvars.iv97
  %85 = load double, double* %84, align 8
  %86 = fadd double %83, %85
  store double %86, double* %84, align 8
  %indvars.iv.next98 = or i64 %indvars.iv97, 1
  %87 = load double, double* %50, align 8
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next98, i64 %indvars.iv103
  %89 = load double, double* %88, align 8
  %90 = fmul double %87, %89
  %91 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %79, i64 0, i64 %indvars.iv101, i64 %indvars.iv.next98
  %92 = load double, double* %91, align 8
  %93 = fadd double %90, %92
  store double %93, double* %91, align 8
  %exitcond100.1 = icmp eq i64 %indvars.iv.next98, 1999
  %indvars.iv.next98.1 = add nsw i64 %indvars.iv97, 2
  br i1 %exitcond100.1, label %._crit_edge10.us.us.loopexit, label %scalar.ph, !llvm.loop !12

.lr.ph2..lr.ph2.split.us_crit_edge:               ; preds = %._crit_edge14.us
  %94 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %5, align 8
  %95 = load [2000 x double]*, [2000 x double]** %4, align 8
  br label %vector.memcheck36

vector.memcheck36:                                ; preds = %._crit_edge.us, %.lr.ph2..lr.ph2.split.us_crit_edge
  %indvars.iv95 = phi i64 [ 0, %.lr.ph2..lr.ph2.split.us_crit_edge ], [ %indvars.iv.next96, %._crit_edge.us ]
  %scevgep24 = getelementptr [2000 x double], [2000 x double]* %95, i64 %indvars.iv95, i64 0
  %scevgep26 = getelementptr [2000 x double], [2000 x double]* %95, i64 %indvars.iv95, i64 2000
  %scevgep28 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %94, i64 0, i64 %indvars.iv95, i64 0
  %scevgep30 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %94, i64 0, i64 %indvars.iv95, i64 2000
  %bound032 = icmp ult double* %scevgep24, %scevgep30
  %bound133 = icmp ult double* %scevgep28, %scevgep26
  %memcheck.conflict35 = and i1 %bound032, %bound133
  br i1 %memcheck.conflict35, label %scalar.ph17.preheader, label %vector.body15.preheader

vector.body15.preheader:                          ; preds = %vector.memcheck36
  br label %vector.body15

vector.body15:                                    ; preds = %vector.body15, %vector.body15.preheader
  %index38 = phi i64 [ 0, %vector.body15.preheader ], [ %index.next39.1, %vector.body15 ]
  %96 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %94, i64 0, i64 %indvars.iv95, i64 %index38
  %97 = bitcast double* %96 to <2 x i64>*
  %wide.load46 = load <2 x i64>, <2 x i64>* %97, align 8, !alias.scope !13
  %98 = getelementptr double, double* %96, i64 2
  %99 = bitcast double* %98 to <2 x i64>*
  %wide.load47 = load <2 x i64>, <2 x i64>* %99, align 8, !alias.scope !13
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %95, i64 %indvars.iv95, i64 %index38
  %101 = bitcast double* %100 to <2 x i64>*
  store <2 x i64> %wide.load46, <2 x i64>* %101, align 8, !alias.scope !16, !noalias !13
  %102 = getelementptr double, double* %100, i64 2
  %103 = bitcast double* %102 to <2 x i64>*
  store <2 x i64> %wide.load47, <2 x i64>* %103, align 8, !alias.scope !16, !noalias !13
  %index.next39 = or i64 %index38, 4
  %104 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %94, i64 0, i64 %indvars.iv95, i64 %index.next39
  %105 = bitcast double* %104 to <2 x i64>*
  %wide.load46.1 = load <2 x i64>, <2 x i64>* %105, align 8, !alias.scope !13
  %106 = getelementptr double, double* %104, i64 2
  %107 = bitcast double* %106 to <2 x i64>*
  %wide.load47.1 = load <2 x i64>, <2 x i64>* %107, align 8, !alias.scope !13
  %108 = getelementptr inbounds [2000 x double], [2000 x double]* %95, i64 %indvars.iv95, i64 %index.next39
  %109 = bitcast double* %108 to <2 x i64>*
  store <2 x i64> %wide.load46.1, <2 x i64>* %109, align 8, !alias.scope !16, !noalias !13
  %110 = getelementptr double, double* %108, i64 2
  %111 = bitcast double* %110 to <2 x i64>*
  store <2 x i64> %wide.load47.1, <2 x i64>* %111, align 8, !alias.scope !16, !noalias !13
  %index.next39.1 = add nsw i64 %index38, 8
  %112 = icmp eq i64 %index.next39.1, 2000
  br i1 %112, label %middle.block16, label %vector.body15, !llvm.loop !18

middle.block16:                                   ; preds = %vector.body15
  br label %._crit_edge.us

scalar.ph17.preheader:                            ; preds = %vector.memcheck36
  br label %scalar.ph17

scalar.ph17:                                      ; preds = %scalar.ph17, %scalar.ph17.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph17.preheader ], [ %indvars.iv.next.4, %scalar.ph17 ]
  %113 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %94, i64 0, i64 %indvars.iv95, i64 %indvars.iv
  %114 = bitcast double* %113 to i64*
  %115 = load i64, i64* %114, align 8
  %116 = getelementptr inbounds [2000 x double], [2000 x double]* %95, i64 %indvars.iv95, i64 %indvars.iv
  %117 = bitcast double* %116 to i64*
  store i64 %115, i64* %117, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %118 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %94, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next
  %119 = bitcast double* %118 to i64*
  %120 = load i64, i64* %119, align 8
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %95, i64 %indvars.iv95, i64 %indvars.iv.next
  %122 = bitcast double* %121 to i64*
  store i64 %120, i64* %122, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %123 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %94, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next.1
  %124 = bitcast double* %123 to i64*
  %125 = load i64, i64* %124, align 8
  %126 = getelementptr inbounds [2000 x double], [2000 x double]* %95, i64 %indvars.iv95, i64 %indvars.iv.next.1
  %127 = bitcast double* %126 to i64*
  store i64 %125, i64* %127, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %128 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %94, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next.2
  %129 = bitcast double* %128 to i64*
  %130 = load i64, i64* %129, align 8
  %131 = getelementptr inbounds [2000 x double], [2000 x double]* %95, i64 %indvars.iv95, i64 %indvars.iv.next.2
  %132 = bitcast double* %131 to i64*
  store i64 %130, i64* %132, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %133 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %94, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next.3
  %134 = bitcast double* %133 to i64*
  %135 = load i64, i64* %134, align 8
  %136 = getelementptr inbounds [2000 x double], [2000 x double]* %95, i64 %indvars.iv95, i64 %indvars.iv.next.3
  %137 = bitcast double* %136 to i64*
  store i64 %135, i64* %137, align 8
  %exitcond94.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond94.4, label %._crit_edge.us.loopexit, label %scalar.ph17, !llvm.loop !19

._crit_edge.us.loopexit:                          ; preds = %scalar.ph17
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block16
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next96, 2000
  br i1 %exitcond48, label %._crit_edge3, label %vector.memcheck36

._crit_edge3:                                     ; preds = %._crit_edge.us
  %138 = bitcast [2000 x [2000 x double]]* %94 to i8*
  call void @free(i8* %138) #5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
.lr.ph56:
  br label %4

; <label>:4:                                      ; preds = %._crit_edge48, %.lr.ph56
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %._crit_edge48 ], [ 0, %.lr.ph56 ]
  %indvars.iv129 = phi i64 [ %indvars.iv.next130, %._crit_edge48 ], [ 4294967295, %.lr.ph56 ]
  %5 = sub i64 1999, %indvars.iv10
  %6 = and i64 %indvars.iv129, 4294967295
  %7 = icmp sgt i64 %indvars.iv10, 0
  br i1 %7, label %.lr.ph32.preheader, label %.lr.ph47.split.preheader

.lr.ph32.preheader:                               ; preds = %4
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv10, i64 0
  br label %.lr.ph32

.lr.ph47.split.preheader:                         ; preds = %4
  %9 = sub i64 0, %indvars.iv10
  %xtraiter25 = and i64 %9, 7
  %lcmp.mod26 = icmp eq i64 %xtraiter25, 0
  br i1 %lcmp.mod26, label %.lr.ph47.split.prol.loopexit, label %.lr.ph47.split.prol.preheader

.lr.ph47.split.prol.preheader:                    ; preds = %.lr.ph47.split.preheader
  br label %.lr.ph47.split.prol

.lr.ph47.split.prol:                              ; preds = %.lr.ph47.split.prol, %.lr.ph47.split.prol.preheader
  %indvars.iv118.prol = phi i64 [ %indvars.iv.next119.prol, %.lr.ph47.split.prol ], [ %indvars.iv10, %.lr.ph47.split.prol.preheader ]
  %prol.iter27 = phi i64 [ %prol.iter27.sub, %.lr.ph47.split.prol ], [ %xtraiter25, %.lr.ph47.split.prol.preheader ]
  %indvars.iv.next119.prol = add nuw nsw i64 %indvars.iv118.prol, 1
  %prol.iter27.sub = add i64 %prol.iter27, -1
  %prol.iter27.cmp = icmp eq i64 %prol.iter27.sub, 0
  br i1 %prol.iter27.cmp, label %.lr.ph47.split.prol.loopexit.loopexit, label %.lr.ph47.split.prol, !llvm.loop !20

.lr.ph47.split.prol.loopexit.loopexit:            ; preds = %.lr.ph47.split.prol
  br label %.lr.ph47.split.prol.loopexit

.lr.ph47.split.prol.loopexit:                     ; preds = %.lr.ph47.split.prol.loopexit.loopexit, %.lr.ph47.split.preheader
  %indvars.iv118.unr = phi i64 [ %indvars.iv10, %.lr.ph47.split.preheader ], [ %indvars.iv.next119.prol, %.lr.ph47.split.prol.loopexit.loopexit ]
  %10 = icmp ult i64 %5, 7
  br i1 %10, label %._crit_edge48, label %.lr.ph47.split.preheader.new

.lr.ph47.split.preheader.new:                     ; preds = %.lr.ph47.split.prol.loopexit
  br label %.lr.ph47.split

.lr.ph32:                                         ; preds = %._crit_edge27, %.lr.ph32.preheader
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %._crit_edge27 ], [ 0, %.lr.ph32.preheader ]
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %._crit_edge27 ], [ 4294967295, %.lr.ph32.preheader ]
  %11 = and i64 %indvars.iv110, 4294967295
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv114
  %13 = load double, double* %12, align 8
  %14 = icmp sgt i64 %indvars.iv114, 0
  br i1 %14, label %.lr.ph26.preheader, label %._crit_edge27

.lr.ph26.preheader:                               ; preds = %.lr.ph32
  %15 = and i64 %indvars.iv110, 1
  %lcmp.mod23 = icmp eq i64 %15, 0
  br i1 %lcmp.mod23, label %.lr.ph26.prol, label %.lr.ph26.prol.loopexit

.lr.ph26.prol:                                    ; preds = %.lr.ph26.preheader
  %16 = load double, double* %8, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv114
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fsub double %13, %19
  br label %.lr.ph26.prol.loopexit

.lr.ph26.prol.loopexit:                           ; preds = %.lr.ph26.prol, %.lr.ph26.preheader
  %.lcssa16.unr.ph = phi double [ %20, %.lr.ph26.prol ], [ undef, %.lr.ph26.preheader ]
  %indvars.iv104.unr.ph = phi i64 [ 1, %.lr.ph26.prol ], [ 0, %.lr.ph26.preheader ]
  %.unr24.ph = phi double [ %20, %.lr.ph26.prol ], [ %13, %.lr.ph26.preheader ]
  %21 = icmp eq i64 %11, 0
  br i1 %21, label %._crit_edge27, label %.lr.ph26.preheader.new

.lr.ph26.preheader.new:                           ; preds = %.lr.ph26.prol.loopexit
  br label %.lr.ph26

.lr.ph26:                                         ; preds = %.lr.ph26, %.lr.ph26.preheader.new
  %indvars.iv104 = phi i64 [ %indvars.iv104.unr.ph, %.lr.ph26.preheader.new ], [ %indvars.iv.next105.1, %.lr.ph26 ]
  %22 = phi double [ %.unr24.ph, %.lr.ph26.preheader.new ], [ %36, %.lr.ph26 ]
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv104
  %24 = bitcast double* %23 to <2 x double>*
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 %indvars.iv114
  %26 = load double, double* %25, align 8
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %27 = load <2 x double>, <2 x double>* %24, align 8
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next105, i64 %indvars.iv114
  %29 = load double, double* %28, align 8
  %30 = insertelement <2 x double> undef, double %26, i32 0
  %31 = insertelement <2 x double> %30, double %29, i32 1
  %32 = fmul <2 x double> %27, %31
  %33 = extractelement <2 x double> %32, i32 0
  %34 = extractelement <2 x double> %32, i32 1
  %35 = fsub double %22, %33
  %36 = fsub double %35, %34
  %exitcond113.1 = icmp eq i64 %indvars.iv.next105, %11
  %indvars.iv.next105.1 = add nsw i64 %indvars.iv104, 2
  br i1 %exitcond113.1, label %._crit_edge27.loopexit, label %.lr.ph26

._crit_edge27.loopexit:                           ; preds = %.lr.ph26
  br label %._crit_edge27

._crit_edge27:                                    ; preds = %._crit_edge27.loopexit, %.lr.ph26.prol.loopexit, %.lr.ph32
  %.lcssa3038 = phi double [ %13, %.lr.ph32 ], [ %.lcssa16.unr.ph, %.lr.ph26.prol.loopexit ], [ %36, %._crit_edge27.loopexit ]
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv114, i64 %indvars.iv114
  %38 = load double, double* %37, align 8
  %39 = fdiv double %.lcssa3038, %38
  store double %39, double* %12, align 8
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %indvars.iv.next111 = add nuw nsw i64 %11, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next115, %indvars.iv10
  br i1 %exitcond12, label %.lr.ph47.split.us.preheader, label %.lr.ph32

.lr.ph47.split.us.preheader:                      ; preds = %._crit_edge27
  %40 = and i64 %indvars.iv129, 1
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv10, i64 0
  br label %.lr.ph47.split.us

.lr.ph47.split.us:                                ; preds = %._crit_edge41.us, %.lr.ph47.split.us.preheader
  %indvars.iv135 = phi i64 [ %indvars.iv.next136, %._crit_edge41.us ], [ %indvars.iv10, %.lr.ph47.split.us.preheader ]
  %42 = icmp eq i64 %40, 0
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv135
  %44 = load double, double* %43, align 8
  br i1 %42, label %45, label %.prol.loopexit29

; <label>:45:                                     ; preds = %.lr.ph47.split.us
  %46 = load double, double* %41, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv135
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fsub double %44, %49
  br label %.prol.loopexit29

.prol.loopexit29:                                 ; preds = %45, %.lr.ph47.split.us
  %.lcssa17.unr.ph = phi double [ %50, %45 ], [ undef, %.lr.ph47.split.us ]
  %indvars.iv123.unr.ph = phi i64 [ 1, %45 ], [ 0, %.lr.ph47.split.us ]
  %.unr32.ph = phi double [ %50, %45 ], [ %44, %.lr.ph47.split.us ]
  %51 = icmp eq i64 %6, 0
  br i1 %51, label %._crit_edge41.us, label %.lr.ph47.split.us.new

.lr.ph47.split.us.new:                            ; preds = %.prol.loopexit29
  br label %52

; <label>:52:                                     ; preds = %52, %.lr.ph47.split.us.new
  %indvars.iv123 = phi i64 [ %indvars.iv123.unr.ph, %.lr.ph47.split.us.new ], [ %indvars.iv.next124.1, %52 ]
  %53 = phi double [ %.unr32.ph, %.lr.ph47.split.us.new ], [ %67, %52 ]
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv123
  %55 = bitcast double* %54 to <2 x double>*
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv123, i64 %indvars.iv135
  %57 = load double, double* %56, align 8
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %58 = load <2 x double>, <2 x double>* %55, align 8
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next124, i64 %indvars.iv135
  %60 = load double, double* %59, align 8
  %61 = insertelement <2 x double> undef, double %57, i32 0
  %62 = insertelement <2 x double> %61, double %60, i32 1
  %63 = fmul <2 x double> %58, %62
  %64 = extractelement <2 x double> %63, i32 0
  %65 = extractelement <2 x double> %63, i32 1
  %66 = fsub double %53, %64
  %67 = fsub double %66, %65
  %exitcond132.1 = icmp eq i64 %indvars.iv.next124, %6
  %indvars.iv.next124.1 = add nsw i64 %indvars.iv123, 2
  br i1 %exitcond132.1, label %._crit_edge41.us.loopexit, label %52

._crit_edge41.us.loopexit:                        ; preds = %52
  br label %._crit_edge41.us

._crit_edge41.us:                                 ; preds = %._crit_edge41.us.loopexit, %.prol.loopexit29
  %.lcssa17 = phi double [ %.lcssa17.unr.ph, %.prol.loopexit29 ], [ %67, %._crit_edge41.us.loopexit ]
  store double %.lcssa17, double* %43, align 8
  %indvars.iv.next136 = add nuw nsw i64 %indvars.iv135, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next136, 2000
  br i1 %exitcond13, label %._crit_edge48.loopexit, label %.lr.ph47.split.us

.lr.ph47.split:                                   ; preds = %.lr.ph47.split, %.lr.ph47.split.preheader.new
  %indvars.iv118 = phi i64 [ %indvars.iv118.unr, %.lr.ph47.split.preheader.new ], [ %indvars.iv.next119.7, %.lr.ph47.split ]
  %exitcond121.7 = icmp eq i64 %indvars.iv118, 1992
  %indvars.iv.next119.7 = add nsw i64 %indvars.iv118, 8
  br i1 %exitcond121.7, label %._crit_edge48.loopexit39, label %.lr.ph47.split

._crit_edge48.loopexit:                           ; preds = %._crit_edge41.us
  br label %._crit_edge48

._crit_edge48.loopexit39:                         ; preds = %.lr.ph47.split
  br label %._crit_edge48

._crit_edge48:                                    ; preds = %._crit_edge48.loopexit39, %._crit_edge48.loopexit, %.lr.ph47.split.prol.loopexit
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %indvars.iv.next130 = add nuw nsw i64 %6, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond14, label %.lr.ph18.preheader, label %4

.lr.ph18.preheader:                               ; preds = %._crit_edge48
  br label %.lr.ph18

.lr.ph18:                                         ; preds = %._crit_edge13, %.lr.ph18.preheader
  %indvars.iv102 = phi i64 [ %indvars.iv.next103, %._crit_edge13 ], [ 0, %.lr.ph18.preheader ]
  %indvars.iv98 = phi i32 [ %indvars.iv.next99, %._crit_edge13 ], [ -1, %.lr.ph18.preheader ]
  %68 = add i64 %indvars.iv102, 4294967295
  %69 = and i64 %68, 4294967295
  %70 = getelementptr inbounds double, double* %1, i64 %indvars.iv102
  %71 = load double, double* %70, align 8
  %72 = icmp sgt i64 %indvars.iv102, 0
  br i1 %72, label %..lr.ph12_crit_edge, label %._crit_edge13

..lr.ph12_crit_edge:                              ; preds = %.lr.ph18
  %wide.trip.count100 = zext i32 %indvars.iv98 to i64
  %xtraiter18 = and i64 %indvars.iv102, 3
  %lcmp.mod19 = icmp eq i64 %xtraiter18, 0
  br i1 %lcmp.mod19, label %.lr.ph12.prol.loopexit, label %.lr.ph12.prol.preheader

.lr.ph12.prol.preheader:                          ; preds = %..lr.ph12_crit_edge
  br label %.lr.ph12.prol

.lr.ph12.prol:                                    ; preds = %.lr.ph12.prol, %.lr.ph12.prol.preheader
  %indvars.iv92.prol = phi i64 [ %indvars.iv.next93.prol, %.lr.ph12.prol ], [ 0, %.lr.ph12.prol.preheader ]
  %73 = phi double [ %79, %.lr.ph12.prol ], [ %71, %.lr.ph12.prol.preheader ]
  %prol.iter20 = phi i64 [ %prol.iter20.sub, %.lr.ph12.prol ], [ %xtraiter18, %.lr.ph12.prol.preheader ]
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv102, i64 %indvars.iv92.prol
  %75 = load double, double* %74, align 8
  %76 = getelementptr inbounds double, double* %3, i64 %indvars.iv92.prol
  %77 = load double, double* %76, align 8
  %78 = fmul double %75, %77
  %79 = fsub double %73, %78
  %indvars.iv.next93.prol = add nuw nsw i64 %indvars.iv92.prol, 1
  %prol.iter20.sub = add i64 %prol.iter20, -1
  %prol.iter20.cmp = icmp eq i64 %prol.iter20.sub, 0
  br i1 %prol.iter20.cmp, label %.lr.ph12.prol.loopexit.loopexit, label %.lr.ph12.prol, !llvm.loop !22

.lr.ph12.prol.loopexit.loopexit:                  ; preds = %.lr.ph12.prol
  br label %.lr.ph12.prol.loopexit

.lr.ph12.prol.loopexit:                           ; preds = %.lr.ph12.prol.loopexit.loopexit, %..lr.ph12_crit_edge
  %.lcssa15.unr = phi double [ undef, %..lr.ph12_crit_edge ], [ %79, %.lr.ph12.prol.loopexit.loopexit ]
  %indvars.iv92.unr = phi i64 [ 0, %..lr.ph12_crit_edge ], [ %indvars.iv.next93.prol, %.lr.ph12.prol.loopexit.loopexit ]
  %.unr21 = phi double [ %71, %..lr.ph12_crit_edge ], [ %79, %.lr.ph12.prol.loopexit.loopexit ]
  %80 = icmp ult i64 %69, 3
  br i1 %80, label %._crit_edge13, label %..lr.ph12_crit_edge.new

..lr.ph12_crit_edge.new:                          ; preds = %.lr.ph12.prol.loopexit
  br label %.lr.ph12

.lr.ph12:                                         ; preds = %.lr.ph12, %..lr.ph12_crit_edge.new
  %indvars.iv92 = phi i64 [ %indvars.iv92.unr, %..lr.ph12_crit_edge.new ], [ %indvars.iv.next93.3, %.lr.ph12 ]
  %81 = phi double [ %.unr21, %..lr.ph12_crit_edge.new ], [ %103, %.lr.ph12 ]
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv102, i64 %indvars.iv92
  %83 = bitcast double* %82 to <2 x double>*
  %84 = getelementptr inbounds double, double* %3, i64 %indvars.iv92
  %85 = bitcast double* %84 to <2 x double>*
  %86 = load <2 x double>, <2 x double>* %83, align 8
  %87 = load <2 x double>, <2 x double>* %85, align 8
  %88 = fmul <2 x double> %86, %87
  %89 = extractelement <2 x double> %88, i32 0
  %90 = extractelement <2 x double> %88, i32 1
  %91 = fsub double %81, %89
  %92 = fsub double %91, %90
  %indvars.iv.next93.1 = add nsw i64 %indvars.iv92, 2
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv102, i64 %indvars.iv.next93.1
  %94 = bitcast double* %93 to <2 x double>*
  %95 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next93.1
  %96 = bitcast double* %95 to <2 x double>*
  %indvars.iv.next93.2 = add nsw i64 %indvars.iv92, 3
  %97 = load <2 x double>, <2 x double>* %94, align 8
  %98 = load <2 x double>, <2 x double>* %96, align 8
  %99 = fmul <2 x double> %97, %98
  %100 = extractelement <2 x double> %99, i32 0
  %101 = extractelement <2 x double> %99, i32 1
  %102 = fsub double %92, %100
  %103 = fsub double %102, %101
  %exitcond101.3 = icmp eq i64 %indvars.iv.next93.2, %wide.trip.count100
  %indvars.iv.next93.3 = add nsw i64 %indvars.iv92, 4
  br i1 %exitcond101.3, label %._crit_edge13.loopexit, label %.lr.ph12

._crit_edge13.loopexit:                           ; preds = %.lr.ph12
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %.lr.ph12.prol.loopexit, %.lr.ph18
  %.lcssa1624 = phi double [ %71, %.lr.ph18 ], [ %.lcssa15.unr, %.lr.ph12.prol.loopexit ], [ %103, %._crit_edge13.loopexit ]
  %104 = getelementptr inbounds double, double* %3, i64 %indvars.iv102
  store double %.lcssa1624, double* %104, align 8
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %indvars.iv.next99 = add nsw i32 %indvars.iv98, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next103, 2000
  br i1 %exitcond9, label %.lr.ph4.preheader, label %.lr.ph18

.lr.ph4.preheader:                                ; preds = %._crit_edge13
  br label %.lr.ph4

.lr.ph4:                                          ; preds = %.lr.ph4.preheader, %._crit_edge._crit_edge
  %indvar = phi i32 [ 0, %.lr.ph4.preheader ], [ %indvar.next, %._crit_edge._crit_edge ]
  %indvars.iv90 = phi i64 [ 1999, %.lr.ph4.preheader ], [ %indvars.iv.next91, %._crit_edge._crit_edge ]
  %indvars.iv = phi i32 [ 2000, %.lr.ph4.preheader ], [ %indvars.iv.next, %._crit_edge._crit_edge ]
  %105 = sub i32 2000, %indvar
  %106 = sext i32 %105 to i64
  %107 = sub nsw i64 1999, %106
  %108 = getelementptr inbounds double, double* %3, i64 %indvars.iv90
  %109 = load double, double* %108, align 8
  %110 = add nsw i64 %indvars.iv90, 1
  %111 = icmp slt i64 %110, 2000
  br i1 %111, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph4
  %112 = sext i32 %indvars.iv to i64
  %113 = sub nsw i64 0, %106
  %xtraiter = and i64 %113, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  br label %114

; <label>:114:                                    ; preds = %114, %.prol.preheader
  %indvars.iv88.prol = phi i64 [ %indvars.iv.next89.prol, %114 ], [ %112, %.prol.preheader ]
  %115 = phi double [ %121, %114 ], [ %109, %.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %114 ], [ %xtraiter, %.prol.preheader ]
  %116 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv90, i64 %indvars.iv88.prol
  %117 = load double, double* %116, align 8
  %118 = getelementptr inbounds double, double* %2, i64 %indvars.iv88.prol
  %119 = load double, double* %118, align 8
  %120 = fmul double %117, %119
  %121 = fsub double %115, %120
  %indvars.iv.next89.prol = add nsw i64 %indvars.iv88.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %114, !llvm.loop !23

.prol.loopexit.loopexit:                          ; preds = %114
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %121, %.prol.loopexit.loopexit ]
  %indvars.iv88.unr = phi i64 [ %112, %.lr.ph ], [ %indvars.iv.next89.prol, %.prol.loopexit.loopexit ]
  %.unr = phi double [ %109, %.lr.ph ], [ %121, %.prol.loopexit.loopexit ]
  %122 = icmp ult i64 %107, 3
  br i1 %122, label %._crit_edge, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %123

; <label>:123:                                    ; preds = %123, %.lr.ph.new
  %indvars.iv88 = phi i64 [ %indvars.iv88.unr, %.lr.ph.new ], [ %indvars.iv.next89.3, %123 ]
  %124 = phi double [ %.unr, %.lr.ph.new ], [ %146, %123 ]
  %125 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv90, i64 %indvars.iv88
  %126 = bitcast double* %125 to <2 x double>*
  %127 = getelementptr inbounds double, double* %2, i64 %indvars.iv88
  %128 = bitcast double* %127 to <2 x double>*
  %129 = load <2 x double>, <2 x double>* %126, align 8
  %130 = load <2 x double>, <2 x double>* %128, align 8
  %131 = fmul <2 x double> %129, %130
  %132 = extractelement <2 x double> %131, i32 0
  %133 = extractelement <2 x double> %131, i32 1
  %134 = fsub double %124, %132
  %135 = fsub double %134, %133
  %indvars.iv.next89.1 = add nsw i64 %indvars.iv88, 2
  %136 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv90, i64 %indvars.iv.next89.1
  %137 = bitcast double* %136 to <2 x double>*
  %138 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next89.1
  %139 = bitcast double* %138 to <2 x double>*
  %indvars.iv.next89.2 = add nsw i64 %indvars.iv88, 3
  %140 = load <2 x double>, <2 x double>* %137, align 8
  %141 = load <2 x double>, <2 x double>* %139, align 8
  %142 = fmul <2 x double> %140, %141
  %143 = extractelement <2 x double> %142, i32 0
  %144 = extractelement <2 x double> %142, i32 1
  %145 = fsub double %135, %143
  %146 = fsub double %145, %144
  %exitcond.3 = icmp eq i64 %indvars.iv.next89.2, 1999
  %indvars.iv.next89.3 = add nsw i64 %indvars.iv88, 4
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %123

._crit_edge.loopexit:                             ; preds = %123
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.lr.ph4
  %.lcssa210 = phi double [ %109, %.lr.ph4 ], [ %.lcssa.unr, %.prol.loopexit ], [ %146, %._crit_edge.loopexit ]
  %147 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv90, i64 %indvars.iv90
  %148 = load double, double* %147, align 8
  %149 = fdiv double %.lcssa210, %148
  %150 = getelementptr inbounds double, double* %2, i64 %indvars.iv90
  store double %149, double* %150, align 8
  %151 = icmp sgt i64 %indvars.iv90, 0
  br i1 %151, label %._crit_edge._crit_edge, label %._crit_edge76

._crit_edge._crit_edge:                           ; preds = %._crit_edge
  %indvars.iv.next91 = add i64 %indvars.iv90, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %.lr.ph4

._crit_edge76:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
.lr.ph:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge2, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge2 ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = srem i32 %5, 20
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %._crit_edge2

; <label>:8:                                      ; preds = %._crit_edge3
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %9) #6
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge3, %8
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge1, label %._crit_edge3

._crit_edge1:                                     ; preds = %._crit_edge2
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %16) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!5, !2}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
!13 = !{!14}
!14 = distinct !{!14, !15}
!15 = distinct !{!15, !"LVerDomain"}
!16 = !{!17}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !10, !11}
!19 = distinct !{!19, !10, !11}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !21}
!23 = distinct !{!23, !21}
