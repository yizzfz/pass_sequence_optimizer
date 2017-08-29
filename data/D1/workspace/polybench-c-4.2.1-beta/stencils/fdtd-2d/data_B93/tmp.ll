; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #3
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_fdtd_2d([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to [1200 x double]*
  %17 = bitcast i8* %4 to [1200 x double]*
  %18 = bitcast i8* %3 to [1200 x double]*
  tail call fastcc void @print_array([1200 x double]* %18, [1200 x double]* %17, [1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) unnamed_addr #0 {
.lr.ph36.preheader:
  br label %.lr.ph36

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %4 = trunc i64 %indvars.iv38 to i32
  %5 = sitofp i32 %4 to double
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %8 = trunc i64 %indvars.iv.next to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv38, i64 %indvars.iv
  %11 = add nuw nsw i64 %indvars.iv, 2
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fmul <2 x double> %7, %15
  %17 = fdiv <2 x double> %16, <double 1.000000e+03, double 1.200000e+03>
  %18 = extractelement <2 x double> %17, i32 0
  %19 = extractelement <2 x double> %17, i32 1
  store double %18, double* %10, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv38, i64 %indvars.iv
  store double %19, double* %20, align 8
  %21 = add nuw nsw i64 %indvars.iv, 3
  %22 = trunc i64 %21 to i32
  %23 = sitofp i32 %22 to double
  %24 = fmul double %5, %23
  %25 = fdiv double %24, 1.000000e+03
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv38, i64 %indvars.iv
  store double %25, double* %26, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1199
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next39, 1000
  br i1 %exitcond1, label %._crit_edge33, label %.preheader.us

.lr.ph36:                                         ; preds = %.lr.ph36, %.lr.ph36.preheader
  %indvars.iv41 = phi i64 [ 0, %.lr.ph36.preheader ], [ %indvars.iv.next42.4, %.lr.ph36 ]
  %27 = trunc i64 %indvars.iv41 to i32
  %28 = sitofp i32 %27 to double
  %29 = getelementptr inbounds double, double* %3, i64 %indvars.iv41
  store double %28, double* %29, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %30 = trunc i64 %indvars.iv.next42 to i32
  %31 = sitofp i32 %30 to double
  %32 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next42
  store double %31, double* %32, align 8
  %indvars.iv.next42.1 = add nsw i64 %indvars.iv41, 2
  %33 = trunc i64 %indvars.iv.next42.1 to i32
  %34 = sitofp i32 %33 to double
  %35 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next42.1
  store double %34, double* %35, align 8
  %indvars.iv.next42.2 = add nsw i64 %indvars.iv41, 3
  %36 = trunc i64 %indvars.iv.next42.2 to i32
  %37 = sitofp i32 %36 to double
  %38 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next42.2
  store double %37, double* %38, align 8
  %indvars.iv.next42.3 = add nsw i64 %indvars.iv41, 4
  %39 = trunc i64 %indvars.iv.next42.3 to i32
  %40 = sitofp i32 %39 to double
  %41 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next42.3
  store double %40, double* %41, align 8
  %exitcond44.4 = icmp eq i64 %indvars.iv.next42.3, 499
  %indvars.iv.next42.4 = add nsw i64 %indvars.iv41, 5
  br i1 %exitcond44.4, label %.preheader.us.preheader, label %.lr.ph36

.preheader.us.preheader:                          ; preds = %.lr.ph36
  br label %.preheader.us

._crit_edge33:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_fdtd_2d([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) unnamed_addr #0 {
.preheader78.lr.ph:
  %scevgep225 = getelementptr [1200 x double], [1200 x double]* %1, i64 1, i64 0
  br label %vector.memcheck232

vector.memcheck232:                               ; preds = %._crit_edge91, %.preheader78.lr.ph
  %indvars.iv121 = phi i64 [ 0, %.preheader78.lr.ph ], [ %indvars.iv.next122, %._crit_edge91 ]
  %4 = getelementptr inbounds double, double* %3, i64 %indvars.iv121
  %5 = bitcast double* %4 to [1200 x double]*
  %bound0228 = icmp ugt [1200 x double]* %5, %1
  %bound1229 = icmp ult double* %4, %scevgep225
  %memcheck.conflict231 = and i1 %bound0228, %bound1229
  br i1 %memcheck.conflict231, label %scalar.ph222.preheader, label %vector.body220.preheader

vector.body220.preheader:                         ; preds = %vector.memcheck232
  %6 = bitcast double* %4 to i64*
  %7 = bitcast double* %4 to i64*
  %8 = bitcast double* %4 to i64*
  br label %vector.body220

scalar.ph222.preheader:                           ; preds = %vector.memcheck232
  %9 = bitcast double* %4 to i64*
  %10 = bitcast double* %4 to i64*
  %11 = bitcast double* %4 to i64*
  %12 = bitcast double* %4 to i64*
  %13 = bitcast double* %4 to i64*
  %14 = bitcast double* %4 to i64*
  %15 = bitcast double* %4 to i64*
  %16 = bitcast double* %4 to i64*
  br label %scalar.ph222

vector.body220:                                   ; preds = %vector.body220, %vector.body220.preheader
  %index234 = phi i64 [ 0, %vector.body220.preheader ], [ %index.next235.2, %vector.body220 ]
  %17 = load i64, i64* %6, align 8, !alias.scope !1
  %18 = insertelement <2 x i64> undef, i64 %17, i32 0
  %19 = shufflevector <2 x i64> %18, <2 x i64> undef, <2 x i32> zeroinitializer
  %20 = insertelement <2 x i64> undef, i64 %17, i32 0
  %21 = shufflevector <2 x i64> %20, <2 x i64> undef, <2 x i32> zeroinitializer
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index234
  %23 = bitcast double* %22 to <2 x i64>*
  store <2 x i64> %19, <2 x i64>* %23, align 8, !alias.scope !4, !noalias !1
  %24 = getelementptr double, double* %22, i64 2
  %25 = bitcast double* %24 to <2 x i64>*
  store <2 x i64> %21, <2 x i64>* %25, align 8, !alias.scope !4, !noalias !1
  %index.next235 = add nuw nsw i64 %index234, 4
  %26 = load i64, i64* %7, align 8, !alias.scope !1
  %27 = insertelement <2 x i64> undef, i64 %26, i32 0
  %28 = shufflevector <2 x i64> %27, <2 x i64> undef, <2 x i32> zeroinitializer
  %29 = insertelement <2 x i64> undef, i64 %26, i32 0
  %30 = shufflevector <2 x i64> %29, <2 x i64> undef, <2 x i32> zeroinitializer
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index.next235
  %32 = bitcast double* %31 to <2 x i64>*
  store <2 x i64> %28, <2 x i64>* %32, align 8, !alias.scope !4, !noalias !1
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x i64>*
  store <2 x i64> %30, <2 x i64>* %34, align 8, !alias.scope !4, !noalias !1
  %index.next235.1 = add nsw i64 %index234, 8
  %35 = load i64, i64* %8, align 8, !alias.scope !1
  %36 = insertelement <2 x i64> undef, i64 %35, i32 0
  %37 = shufflevector <2 x i64> %36, <2 x i64> undef, <2 x i32> zeroinitializer
  %38 = insertelement <2 x i64> undef, i64 %35, i32 0
  %39 = shufflevector <2 x i64> %38, <2 x i64> undef, <2 x i32> zeroinitializer
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index.next235.1
  %41 = bitcast double* %40 to <2 x i64>*
  store <2 x i64> %37, <2 x i64>* %41, align 8, !alias.scope !4, !noalias !1
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x i64>*
  store <2 x i64> %39, <2 x i64>* %43, align 8, !alias.scope !4, !noalias !1
  %index.next235.2 = add nsw i64 %index234, 12
  %44 = icmp eq i64 %index.next235.2, 1200
  br i1 %44, label %vector.memcheck204.preheader.loopexit2, label %vector.body220, !llvm.loop !6

vector.memcheck204.preheader.loopexit:            ; preds = %scalar.ph222
  br label %vector.memcheck204.preheader

vector.memcheck204.preheader.loopexit2:           ; preds = %vector.body220
  br label %vector.memcheck204.preheader

vector.memcheck204.preheader:                     ; preds = %vector.memcheck204.preheader.loopexit2, %vector.memcheck204.preheader.loopexit
  br label %vector.memcheck204

vector.memcheck204:                               ; preds = %._crit_edge.us, %vector.memcheck204.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge.us ], [ 0, %vector.memcheck204.preheader ]
  %indvars.iv105 = phi i64 [ %indvars.iv.next106, %._crit_edge.us ], [ 1, %vector.memcheck204.preheader ]
  %45 = add nuw nsw i64 %indvar, 1
  %scevgep192 = getelementptr [1200 x double], [1200 x double]* %1, i64 %45, i64 0
  %46 = add nuw nsw i64 %indvar, 2
  %scevgep194 = getelementptr [1200 x double], [1200 x double]* %1, i64 %46, i64 0
  %scevgep196 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvar, i64 0
  %scevgep198 = getelementptr [1200 x double], [1200 x double]* %2, i64 %46, i64 0
  %47 = add nsw i64 %indvars.iv105, -1
  %bound0200 = icmp ult double* %scevgep192, %scevgep198
  %bound1201 = icmp ult double* %scevgep196, %scevgep194
  %memcheck.conflict203 = and i1 %bound0200, %bound1201
  br i1 %memcheck.conflict203, label %scalar.ph189.preheader, label %vector.body187.preheader

vector.body187.preheader:                         ; preds = %vector.memcheck204
  br label %vector.body187

scalar.ph189.preheader:                           ; preds = %vector.memcheck204
  br label %scalar.ph189

vector.body187:                                   ; preds = %vector.body187.preheader, %vector.body187
  %index206 = phi i64 [ %index.next207, %vector.body187 ], [ 0, %vector.body187.preheader ]
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv105, i64 %index206
  %49 = bitcast double* %48 to <2 x double>*
  %wide.load214 = load <2 x double>, <2 x double>* %49, align 8, !alias.scope !9, !noalias !12
  %50 = getelementptr double, double* %48, i64 2
  %51 = bitcast double* %50 to <2 x double>*
  %wide.load215 = load <2 x double>, <2 x double>* %51, align 8, !alias.scope !9, !noalias !12
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv105, i64 %index206
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load216 = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !12
  %54 = getelementptr double, double* %52, i64 2
  %55 = bitcast double* %54 to <2 x double>*
  %wide.load217 = load <2 x double>, <2 x double>* %55, align 8, !alias.scope !12
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %47, i64 %index206
  %57 = bitcast double* %56 to <2 x double>*
  %wide.load218 = load <2 x double>, <2 x double>* %57, align 8, !alias.scope !12
  %58 = getelementptr double, double* %56, i64 2
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load219 = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !12
  %60 = fsub <2 x double> %wide.load216, %wide.load218
  %61 = fsub <2 x double> %wide.load217, %wide.load219
  %62 = fmul <2 x double> %60, <double 5.000000e-01, double 5.000000e-01>
  %63 = fmul <2 x double> %61, <double 5.000000e-01, double 5.000000e-01>
  %64 = fsub <2 x double> %wide.load214, %62
  %65 = fsub <2 x double> %wide.load215, %63
  %66 = bitcast double* %48 to <2 x double>*
  store <2 x double> %64, <2 x double>* %66, align 8, !alias.scope !9, !noalias !12
  %67 = bitcast double* %50 to <2 x double>*
  store <2 x double> %65, <2 x double>* %67, align 8, !alias.scope !9, !noalias !12
  %index.next207 = add nuw nsw i64 %index206, 4
  %68 = icmp eq i64 %index.next207, 1200
  br i1 %68, label %._crit_edge.us.loopexit1, label %vector.body187, !llvm.loop !14

scalar.ph189:                                     ; preds = %scalar.ph189, %scalar.ph189.preheader
  %indvars.iv101 = phi i64 [ 0, %scalar.ph189.preheader ], [ %indvars.iv.next102.1, %scalar.ph189 ]
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv105, i64 %indvars.iv101
  %70 = load double, double* %69, align 8
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv105, i64 %indvars.iv101
  %72 = load double, double* %71, align 8
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %47, i64 %indvars.iv101
  %74 = load double, double* %73, align 8
  %75 = fsub double %72, %74
  %76 = fmul double %75, 5.000000e-01
  %77 = fsub double %70, %76
  store double %77, double* %69, align 8
  %indvars.iv.next102 = or i64 %indvars.iv101, 1
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv105, i64 %indvars.iv.next102
  %79 = load double, double* %78, align 8
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv105, i64 %indvars.iv.next102
  %81 = load double, double* %80, align 8
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %47, i64 %indvars.iv.next102
  %83 = load double, double* %82, align 8
  %84 = fsub double %81, %83
  %85 = fmul double %84, 5.000000e-01
  %86 = fsub double %79, %85
  store double %86, double* %78, align 8
  %exitcond104.1 = icmp eq i64 %indvars.iv.next102, 1199
  %indvars.iv.next102.1 = add nsw i64 %indvars.iv101, 2
  br i1 %exitcond104.1, label %._crit_edge.us.loopexit, label %scalar.ph189, !llvm.loop !15

._crit_edge.us.loopexit:                          ; preds = %scalar.ph189
  br label %._crit_edge.us

._crit_edge.us.loopexit1:                         ; preds = %vector.body187
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit1, %._crit_edge.us.loopexit
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond3 = icmp eq i64 %indvar.next, 999
  br i1 %exitcond3, label %vector.memcheck171.preheader, label %vector.memcheck204

vector.memcheck171.preheader:                     ; preds = %._crit_edge.us
  br label %vector.memcheck171

scalar.ph222:                                     ; preds = %scalar.ph222, %scalar.ph222.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph222.preheader ], [ %indvars.iv.next.7, %scalar.ph222 ]
  %87 = load i64, i64* %9, align 8
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv
  %89 = bitcast double* %88 to i64*
  store i64 %87, i64* %89, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %90 = load i64, i64* %10, align 8
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next
  %92 = bitcast double* %91 to i64*
  store i64 %90, i64* %92, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %93 = load i64, i64* %11, align 8
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.1
  %95 = bitcast double* %94 to i64*
  store i64 %93, i64* %95, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %96 = load i64, i64* %12, align 8
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.2
  %98 = bitcast double* %97 to i64*
  store i64 %96, i64* %98, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %99 = load i64, i64* %13, align 8
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.3
  %101 = bitcast double* %100 to i64*
  store i64 %99, i64* %101, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %102 = load i64, i64* %14, align 8
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.4
  %104 = bitcast double* %103 to i64*
  store i64 %102, i64* %104, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %105 = load i64, i64* %15, align 8
  %106 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.5
  %107 = bitcast double* %106 to i64*
  store i64 %105, i64* %107, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %108 = load i64, i64* %16, align 8
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.6
  %110 = bitcast double* %109 to i64*
  store i64 %108, i64* %110, align 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.6, 1199
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  br i1 %exitcond.7, label %vector.memcheck204.preheader.loopexit, label %scalar.ph222, !llvm.loop !16

vector.memcheck171:                               ; preds = %._crit_edge85.us, %vector.memcheck171.preheader
  %indvars.iv112 = phi i64 [ %indvars.iv.next113, %._crit_edge85.us ], [ 0, %vector.memcheck171.preheader ]
  %scevgep159 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv112, i64 1
  %111 = add nuw nsw i64 %indvars.iv112, 1
  %scevgep161 = getelementptr [1200 x double], [1200 x double]* %0, i64 %111, i64 0
  %scevgep163 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv112, i64 0
  %scevgep165 = getelementptr [1200 x double], [1200 x double]* %2, i64 %111, i64 0
  %bound0167 = icmp ult double* %scevgep159, %scevgep165
  %bound1168 = icmp ult double* %scevgep163, %scevgep161
  %memcheck.conflict170 = and i1 %bound0167, %bound1168
  br i1 %memcheck.conflict170, label %scalar.ph156.preheader, label %vector.body154.preheader

vector.body154.preheader:                         ; preds = %vector.memcheck171
  br label %vector.body154

vector.body154:                                   ; preds = %vector.body154.preheader, %vector.body154
  %index173 = phi i64 [ %index.next174, %vector.body154 ], [ 0, %vector.body154.preheader ]
  %offset.idx = or i64 %index173, 1
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv112, i64 %offset.idx
  %113 = bitcast double* %112 to <2 x double>*
  %wide.load181 = load <2 x double>, <2 x double>* %113, align 8, !alias.scope !17, !noalias !20
  %114 = getelementptr double, double* %112, i64 2
  %115 = bitcast double* %114 to <2 x double>*
  %wide.load182 = load <2 x double>, <2 x double>* %115, align 8, !alias.scope !17, !noalias !20
  %116 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv112, i64 %offset.idx
  %117 = bitcast double* %116 to <2 x double>*
  %wide.load183 = load <2 x double>, <2 x double>* %117, align 8, !alias.scope !20
  %118 = getelementptr double, double* %116, i64 2
  %119 = bitcast double* %118 to <2 x double>*
  %wide.load184 = load <2 x double>, <2 x double>* %119, align 8, !alias.scope !20
  %120 = add nsw i64 %offset.idx, -1
  %121 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv112, i64 %120
  %122 = bitcast double* %121 to <2 x double>*
  %wide.load185 = load <2 x double>, <2 x double>* %122, align 8, !alias.scope !20
  %123 = getelementptr double, double* %121, i64 2
  %124 = bitcast double* %123 to <2 x double>*
  %wide.load186 = load <2 x double>, <2 x double>* %124, align 8, !alias.scope !20
  %125 = fsub <2 x double> %wide.load183, %wide.load185
  %126 = fsub <2 x double> %wide.load184, %wide.load186
  %127 = fmul <2 x double> %125, <double 5.000000e-01, double 5.000000e-01>
  %128 = fmul <2 x double> %126, <double 5.000000e-01, double 5.000000e-01>
  %129 = fsub <2 x double> %wide.load181, %127
  %130 = fsub <2 x double> %wide.load182, %128
  %131 = bitcast double* %112 to <2 x double>*
  store <2 x double> %129, <2 x double>* %131, align 8, !alias.scope !17, !noalias !20
  %132 = bitcast double* %114 to <2 x double>*
  store <2 x double> %130, <2 x double>* %132, align 8, !alias.scope !17, !noalias !20
  %index.next174 = add nuw nsw i64 %index173, 4
  %133 = icmp eq i64 %index.next174, 1196
  br i1 %133, label %scalar.ph156.preheader.loopexit, label %vector.body154, !llvm.loop !22

scalar.ph156.preheader.loopexit:                  ; preds = %vector.body154
  br label %scalar.ph156.preheader

scalar.ph156.preheader:                           ; preds = %scalar.ph156.preheader.loopexit, %vector.memcheck171
  %indvars.iv108.ph = phi i64 [ 1, %vector.memcheck171 ], [ 1197, %scalar.ph156.preheader.loopexit ]
  br i1 true, label %scalar.ph156.prol.preheader, label %scalar.ph156.prol.loopexit.unr-lcssa

scalar.ph156.prol.preheader:                      ; preds = %scalar.ph156.preheader
  br label %scalar.ph156.prol

scalar.ph156.prol:                                ; preds = %scalar.ph156.prol.preheader
  %134 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv112, i64 %indvars.iv108.ph
  %135 = load double, double* %134, align 8
  %136 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv112, i64 %indvars.iv108.ph
  %137 = load double, double* %136, align 8
  %138 = add nsw i64 %indvars.iv108.ph, -1
  %139 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv112, i64 %138
  %140 = load double, double* %139, align 8
  %141 = fsub double %137, %140
  %142 = fmul double %141, 5.000000e-01
  %143 = fsub double %135, %142
  store double %143, double* %134, align 8
  %indvars.iv.next109.prol = add nuw nsw i64 %indvars.iv108.ph, 1
  br label %scalar.ph156.prol.loopexit.unr-lcssa

scalar.ph156.prol.loopexit.unr-lcssa:             ; preds = %scalar.ph156.preheader, %scalar.ph156.prol
  %indvars.iv108.unr.ph = phi i64 [ %indvars.iv.next109.prol, %scalar.ph156.prol ], [ %indvars.iv108.ph, %scalar.ph156.preheader ]
  br label %scalar.ph156.prol.loopexit

scalar.ph156.prol.loopexit:                       ; preds = %scalar.ph156.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge85.us, label %scalar.ph156.preheader.new

scalar.ph156.preheader.new:                       ; preds = %scalar.ph156.prol.loopexit
  br label %scalar.ph156

scalar.ph156:                                     ; preds = %scalar.ph156, %scalar.ph156.preheader.new
  %indvars.iv108 = phi i64 [ %indvars.iv108.unr.ph, %scalar.ph156.preheader.new ], [ %indvars.iv.next109.1, %scalar.ph156 ]
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv112, i64 %indvars.iv108
  %145 = load double, double* %144, align 8
  %146 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv112, i64 %indvars.iv108
  %147 = load double, double* %146, align 8
  %148 = add nsw i64 %indvars.iv108, -1
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv112, i64 %148
  %150 = load double, double* %149, align 8
  %151 = fsub double %147, %150
  %152 = fmul double %151, 5.000000e-01
  %153 = fsub double %145, %152
  store double %153, double* %144, align 8
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv112, i64 %indvars.iv.next109
  %155 = load double, double* %154, align 8
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv112, i64 %indvars.iv.next109
  %157 = load double, double* %156, align 8
  %158 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv112, i64 %indvars.iv108
  %159 = load double, double* %158, align 8
  %160 = fsub double %157, %159
  %161 = fmul double %160, 5.000000e-01
  %162 = fsub double %155, %161
  store double %162, double* %154, align 8
  %exitcond111.1 = icmp eq i64 %indvars.iv.next109, 1199
  %indvars.iv.next109.1 = add nsw i64 %indvars.iv108, 2
  br i1 %exitcond111.1, label %._crit_edge85.us.unr-lcssa, label %scalar.ph156, !llvm.loop !23

._crit_edge85.us.unr-lcssa:                       ; preds = %scalar.ph156
  br label %._crit_edge85.us

._crit_edge85.us:                                 ; preds = %scalar.ph156.prol.loopexit, %._crit_edge85.us.unr-lcssa
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next113, 1000
  br i1 %exitcond4, label %vector.memcheck.preheader, label %vector.memcheck171

vector.memcheck.preheader:                        ; preds = %._crit_edge85.us
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %._crit_edge89.us, %vector.memcheck.preheader
  %indvars.iv119 = phi i64 [ %indvars.iv.next120, %._crit_edge89.us ], [ 0, %vector.memcheck.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv119, i64 0
  %scevgep131 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv119, i64 1199
  %scevgep133 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv119, i64 0
  %163 = add nuw nsw i64 %indvars.iv119, 1
  %scevgep135 = getelementptr [1200 x double], [1200 x double]* %0, i64 %163, i64 0
  %scevgep137 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv119, i64 0
  %scevgep139 = getelementptr [1200 x double], [1200 x double]* %1, i64 %163, i64 1199
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %bound0 = icmp ult double* %scevgep, %scevgep135
  %bound1 = icmp ult double* %scevgep133, %scevgep131
  %found.conflict = and i1 %bound0, %bound1
  %bound0141 = icmp ult double* %scevgep, %scevgep139
  %bound1142 = icmp ult double* %scevgep137, %scevgep131
  %found.conflict143 = and i1 %bound0141, %bound1142
  %conflict.rdx = or i1 %found.conflict, %found.conflict143
  br i1 %conflict.rdx, label %._crit_edge99.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %164 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv119, i64 %index
  %165 = bitcast double* %164 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %165, align 8, !alias.scope !24, !noalias !27
  %166 = getelementptr double, double* %164, i64 2
  %167 = bitcast double* %166 to <2 x double>*
  %wide.load145 = load <2 x double>, <2 x double>* %167, align 8, !alias.scope !24, !noalias !27
  %168 = or i64 %index, 1
  %169 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv119, i64 %168
  %170 = bitcast double* %169 to <2 x double>*
  %wide.load146 = load <2 x double>, <2 x double>* %170, align 8, !alias.scope !30
  %171 = getelementptr double, double* %169, i64 2
  %172 = bitcast double* %171 to <2 x double>*
  %wide.load147 = load <2 x double>, <2 x double>* %172, align 8, !alias.scope !30
  %173 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv119, i64 %index
  %174 = bitcast double* %173 to <2 x double>*
  %wide.load148 = load <2 x double>, <2 x double>* %174, align 8, !alias.scope !30
  %175 = getelementptr double, double* %173, i64 2
  %176 = bitcast double* %175 to <2 x double>*
  %wide.load149 = load <2 x double>, <2 x double>* %176, align 8, !alias.scope !30
  %177 = fsub <2 x double> %wide.load146, %wide.load148
  %178 = fsub <2 x double> %wide.load147, %wide.load149
  %179 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next120, i64 %index
  %180 = bitcast double* %179 to <2 x double>*
  %wide.load150 = load <2 x double>, <2 x double>* %180, align 8, !alias.scope !31
  %181 = getelementptr double, double* %179, i64 2
  %182 = bitcast double* %181 to <2 x double>*
  %wide.load151 = load <2 x double>, <2 x double>* %182, align 8, !alias.scope !31
  %183 = fadd <2 x double> %177, %wide.load150
  %184 = fadd <2 x double> %178, %wide.load151
  %185 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv119, i64 %index
  %186 = bitcast double* %185 to <2 x double>*
  %wide.load152 = load <2 x double>, <2 x double>* %186, align 8, !alias.scope !31
  %187 = getelementptr double, double* %185, i64 2
  %188 = bitcast double* %187 to <2 x double>*
  %wide.load153 = load <2 x double>, <2 x double>* %188, align 8, !alias.scope !31
  %189 = fsub <2 x double> %183, %wide.load152
  %190 = fsub <2 x double> %184, %wide.load153
  %191 = fmul <2 x double> %189, <double 7.000000e-01, double 7.000000e-01>
  %192 = fmul <2 x double> %190, <double 7.000000e-01, double 7.000000e-01>
  %193 = fsub <2 x double> %wide.load, %191
  %194 = fsub <2 x double> %wide.load145, %192
  %195 = bitcast double* %164 to <2 x double>*
  store <2 x double> %193, <2 x double>* %195, align 8, !alias.scope !24, !noalias !27
  %196 = bitcast double* %166 to <2 x double>*
  store <2 x double> %194, <2 x double>* %196, align 8, !alias.scope !24, !noalias !27
  %index.next = add nuw nsw i64 %index, 4
  %197 = icmp eq i64 %index.next, 1196
  br i1 %197, label %._crit_edge99.preheader.loopexit, label %vector.body, !llvm.loop !32

._crit_edge99.preheader.loopexit:                 ; preds = %vector.body
  br label %._crit_edge99.preheader

._crit_edge99.preheader:                          ; preds = %._crit_edge99.preheader.loopexit, %vector.memcheck
  %indvars.iv115.ph = phi i64 [ 0, %vector.memcheck ], [ 1196, %._crit_edge99.preheader.loopexit ]
  br label %._crit_edge99

._crit_edge99:                                    ; preds = %._crit_edge99.preheader, %._crit_edge99
  %indvars.iv115 = phi i64 [ %indvars.iv.next116, %._crit_edge99 ], [ %indvars.iv115.ph, %._crit_edge99.preheader ]
  %198 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv119, i64 %indvars.iv115
  %199 = load double, double* %198, align 8
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %200 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv119, i64 %indvars.iv.next116
  %201 = load double, double* %200, align 8
  %202 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv119, i64 %indvars.iv115
  %203 = load double, double* %202, align 8
  %204 = fsub double %201, %203
  %205 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next120, i64 %indvars.iv115
  %206 = load double, double* %205, align 8
  %207 = fadd double %204, %206
  %208 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv119, i64 %indvars.iv115
  %209 = load double, double* %208, align 8
  %210 = fsub double %207, %209
  %211 = fmul double %210, 7.000000e-01
  %212 = fsub double %199, %211
  store double %212, double* %198, align 8
  %exitcond118 = icmp eq i64 %indvars.iv115, 1198
  br i1 %exitcond118, label %._crit_edge89.us, label %._crit_edge99, !llvm.loop !33

._crit_edge89.us:                                 ; preds = %._crit_edge99
  %exitcond5 = icmp eq i64 %indvars.iv.next120, 999
  br i1 %exitcond5, label %._crit_edge91, label %vector.memcheck

._crit_edge91:                                    ; preds = %._crit_edge89.us
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next122, 500
  br i1 %exitcond6, label %._crit_edge93, label %vector.memcheck232

._crit_edge93:                                    ; preds = %._crit_edge91
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]*, [1200 x double]*, [1200 x double]*) unnamed_addr #0 {
.preheader45.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader45.us

.preheader45.us:                                  ; preds = %._crit_edge56.us, %.preheader45.us.preheader
  %indvars.iv76 = phi i64 [ 0, %.preheader45.us.preheader ], [ %indvars.iv.next77, %._crit_edge56.us ]
  %7 = mul nuw nsw i64 %indvars.iv76, 1000
  br label %._crit_edge62

._crit_edge62:                                    ; preds = %._crit_edge, %.preheader45.us
  %indvars.iv74 = phi i64 [ 0, %.preheader45.us ], [ %indvars.iv.next75, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv74, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge62
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc43.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge62, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv76, i64 %indvars.iv74
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next75, 1200
  br i1 %exitcond4, label %._crit_edge56.us, label %._crit_edge62

._crit_edge56.us:                                 ; preds = %._crit_edge
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next77, 1000
  br i1 %exitcond5, label %.preheader44.us.preheader, label %.preheader45.us

.preheader44.us.preheader:                        ; preds = %._crit_edge56.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #4
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %.preheader44.us

.preheader44.us:                                  ; preds = %._crit_edge51.us, %.preheader44.us.preheader
  %indvars.iv71 = phi i64 [ 0, %.preheader44.us.preheader ], [ %indvars.iv.next72, %._crit_edge51.us ]
  %24 = mul nuw nsw i64 %indvars.iv71, 1000
  br label %._crit_edge64

._crit_edge64:                                    ; preds = %._crit_edge63, %.preheader44.us
  %indvars.iv69 = phi i64 [ 0, %.preheader44.us ], [ %indvars.iv.next70, %._crit_edge63 ]
  %25 = add nuw nsw i64 %indvars.iv69, %24
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 20
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %._crit_edge63

; <label>:29:                                     ; preds = %._crit_edge64
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc40.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %30) #4
  br label %._crit_edge63

._crit_edge63:                                    ; preds = %._crit_edge64, %29
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv69
  %33 = load double, double* %32, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %33) #5
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next70, 1200
  br i1 %exitcond2, label %._crit_edge51.us, label %._crit_edge64

._crit_edge51.us:                                 ; preds = %._crit_edge63
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next72, 1000
  br i1 %exitcond3, label %.preheader.us.preheader, label %.preheader44.us

.preheader.us.preheader:                          ; preds = %._crit_edge51.us
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv67 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next68, %._crit_edge.us ]
  %39 = mul nuw nsw i64 %indvars.iv67, 1000
  br label %._crit_edge66

._crit_edge66:                                    ; preds = %._crit_edge65, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge65 ]
  %40 = add nuw nsw i64 %indvars.iv, %39
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, 20
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %._crit_edge65

; <label>:44:                                     ; preds = %._crit_edge66
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %45) #4
  br label %._crit_edge65

._crit_edge65:                                    ; preds = %._crit_edge66, %44
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv67, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %48) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge66

._crit_edge.us:                                   ; preds = %._crit_edge65
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next68, 1000
  br i1 %exitcond1, label %._crit_edge48, label %.preheader.us

._crit_edge48:                                    ; preds = %._crit_edge.us
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
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
!9 = !{!10}
!10 = distinct !{!10, !11}
!11 = distinct !{!11, !"LVerDomain"}
!12 = !{!13}
!13 = distinct !{!13, !11}
!14 = distinct !{!14, !7, !8}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !7, !8}
!23 = distinct !{!23, !7, !8}
!24 = !{!25}
!25 = distinct !{!25, !26}
!26 = distinct !{!26, !"LVerDomain"}
!27 = !{!28, !29}
!28 = distinct !{!28, !26}
!29 = distinct !{!29, !26}
!30 = !{!28}
!31 = !{!29}
!32 = distinct !{!32, !7, !8}
!33 = distinct !{!33, !7, !8}
