; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #3
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call void @init_array(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #3
  tail call void @kernel_fdtd_2d(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
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
  tail call void @print_array(i32 1000, i32 1200, [1200 x double]* %18, [1200 x double]* %17, [1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #0 {
.lr.ph4.preheader:
  br label %.lr.ph4

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %7 = trunc i64 %indvars.iv6 to i32
  %8 = sitofp i32 %7 to double
  %9 = insertelement <2 x double> undef, double %8, i32 0
  %10 = shufflevector <2 x double> %9, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %11 = trunc i64 %indvars.iv.next to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv6, i64 %indvars.iv
  %14 = add nuw nsw i64 %indvars.iv, 2
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = insertelement <2 x double> undef, double %12, i32 0
  %18 = insertelement <2 x double> %17, double %16, i32 1
  %19 = fmul <2 x double> %10, %18
  %20 = fdiv <2 x double> %19, <double 1.000000e+03, double 1.200000e+03>
  %21 = extractelement <2 x double> %20, i32 0
  %22 = extractelement <2 x double> %20, i32 1
  store double %21, double* %13, align 8
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv6, i64 %indvars.iv
  store double %22, double* %23, align 8
  %24 = add nuw nsw i64 %indvars.iv, 3
  %25 = trunc i64 %24 to i32
  %26 = sitofp i32 %25 to double
  %27 = fmul double %8, %26
  %28 = fdiv double %27, 1.000000e+03
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv6, i64 %indvars.iv
  store double %28, double* %29, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, 1000
  br i1 %exitcond9, label %._crit_edge2, label %.preheader.us

.lr.ph4:                                          ; preds = %.lr.ph4, %.lr.ph4.preheader
  %indvars.iv11 = phi i64 [ 0, %.lr.ph4.preheader ], [ %indvars.iv.next12.4, %.lr.ph4 ]
  %30 = trunc i64 %indvars.iv11 to i32
  %31 = sitofp i32 %30 to double
  %32 = getelementptr inbounds double, double* %6, i64 %indvars.iv11
  %33 = bitcast double* %32 to <2 x double>*
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %34 = trunc i64 %indvars.iv.next12 to i32
  %35 = sitofp i32 %34 to double
  %36 = insertelement <2 x double> undef, double %31, i32 0
  %37 = insertelement <2 x double> %36, double %35, i32 1
  store <2 x double> %37, <2 x double>* %33, align 8
  %indvars.iv.next12.1 = add nuw nsw i64 %indvars.iv11, 2
  %38 = trunc i64 %indvars.iv.next12.1 to i32
  %39 = sitofp i32 %38 to double
  %40 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next12.1
  %41 = bitcast double* %40 to <2 x double>*
  %indvars.iv.next12.2 = add nuw nsw i64 %indvars.iv11, 3
  %42 = trunc i64 %indvars.iv.next12.2 to i32
  %43 = sitofp i32 %42 to double
  %44 = insertelement <2 x double> undef, double %39, i32 0
  %45 = insertelement <2 x double> %44, double %43, i32 1
  store <2 x double> %45, <2 x double>* %41, align 8
  %indvars.iv.next12.3 = add nuw nsw i64 %indvars.iv11, 4
  %46 = trunc i64 %indvars.iv.next12.3 to i32
  %47 = sitofp i32 %46 to double
  %48 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next12.3
  store double %47, double* %48, align 8
  %indvars.iv.next12.4 = add nuw nsw i64 %indvars.iv11, 5
  %exitcond14.4 = icmp eq i64 %indvars.iv.next12.4, 500
  br i1 %exitcond14.4, label %.preheader.us.preheader, label %.lr.ph4

.preheader.us.preheader:                          ; preds = %.lr.ph4
  br label %.preheader.us

._crit_edge2:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_fdtd_2d(i32, i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #0 {
.preheader6.lr.ph:
  %sunkaddr = ptrtoint double* %6 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge12, %.preheader6.lr.ph
  %indvars.iv44 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next45, %._crit_edge12 ]
  %sunkaddr50 = shl i64 %indvars.iv44, 3
  %sunkaddr51 = add i64 %sunkaddr, %sunkaddr50
  %sunkaddr52 = inttoptr i64 %sunkaddr51 to i64*
  br label %._crit_edge48

.preheader2.us:                                   ; preds = %.preheader2.us.preheader, %._crit_edge.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge.us ], [ 0, %.preheader2.us.preheader ]
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %._crit_edge.us ], [ 1, %.preheader2.us.preheader ]
  %7 = add nuw nsw i64 %indvar, 1
  %scevgep122 = getelementptr [1200 x double], [1200 x double]* %4, i64 %7, i64 0
  %8 = add nuw nsw i64 %indvar, 2
  %scevgep124 = getelementptr [1200 x double], [1200 x double]* %4, i64 %8, i64 0
  %scevgep126 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvar, i64 0
  %scevgep128 = getelementptr [1200 x double], [1200 x double]* %5, i64 %8, i64 0
  %9 = add nsw i64 %indvars.iv22, -1
  %bound0130 = icmp ult double* %scevgep122, %scevgep128
  %bound1131 = icmp ult double* %scevgep126, %scevgep124
  %memcheck.conflict133 = and i1 %bound0130, %bound1131
  br i1 %memcheck.conflict133, label %._crit_edge.preheader, label %vector.body117.preheader

vector.body117.preheader:                         ; preds = %.preheader2.us
  br label %vector.body117

._crit_edge.preheader:                            ; preds = %.preheader2.us
  br label %._crit_edge

vector.body117:                                   ; preds = %vector.body117.preheader, %vector.body117
  %index136 = phi i64 [ %index.next137, %vector.body117 ], [ 0, %vector.body117.preheader ]
  %offset.idx140 = shl i64 %index136, 1
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv22, i64 %offset.idx140
  %11 = bitcast double* %10 to <4 x double>*
  %wide.vec144 = load <4 x double>, <4 x double>* %11, align 8, !alias.scope !1, !noalias !4
  %strided.vec145 = shufflevector <4 x double> %wide.vec144, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec146 = shufflevector <4 x double> %wide.vec144, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv22, i64 %offset.idx140
  %13 = bitcast double* %12 to <4 x double>*
  %wide.vec147 = load <4 x double>, <4 x double>* %13, align 8, !alias.scope !4
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %9, i64 %offset.idx140
  %15 = bitcast double* %14 to <4 x double>*
  %wide.vec150 = load <4 x double>, <4 x double>* %15, align 8, !alias.scope !4
  %16 = fsub <4 x double> %wide.vec147, %wide.vec150
  %17 = shufflevector <4 x double> %16, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %18 = fmul <2 x double> %17, <double 5.000000e-01, double 5.000000e-01>
  %19 = fsub <2 x double> %strided.vec145, %18
  %20 = or i64 %offset.idx140, 1
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv22, i64 %20
  %22 = fsub <4 x double> %wide.vec147, %wide.vec150
  %23 = shufflevector <4 x double> %22, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %24 = fmul <2 x double> %23, <double 5.000000e-01, double 5.000000e-01>
  %25 = fsub <2 x double> %strided.vec146, %24
  %26 = getelementptr double, double* %21, i64 -1
  %27 = bitcast double* %26 to <4 x double>*
  %interleaved.vec153 = shufflevector <2 x double> %19, <2 x double> %25, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec153, <4 x double>* %27, align 8, !alias.scope !1, !noalias !4
  %index.next137 = add nuw nsw i64 %index136, 2
  %28 = icmp eq i64 %index.next137, 600
  br i1 %28, label %._crit_edge.us.loopexit154, label %vector.body117, !llvm.loop !6

._crit_edge:                                      ; preds = %._crit_edge.preheader, %._crit_edge
  %indvars.iv18 = phi i64 [ %indvars.iv.next19.1, %._crit_edge ], [ 0, %._crit_edge.preheader ]
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv22, i64 %indvars.iv18
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv22, i64 %indvars.iv18
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %9, i64 %indvars.iv18
  %34 = load double, double* %33, align 8
  %35 = fsub double %32, %34
  %36 = fmul double %35, 5.000000e-01
  %37 = fsub double %30, %36
  store double %37, double* %29, align 8
  %indvars.iv.next19 = or i64 %indvars.iv18, 1
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv22, i64 %indvars.iv.next19
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv22, i64 %indvars.iv.next19
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %9, i64 %indvars.iv.next19
  %43 = load double, double* %42, align 8
  %44 = fsub double %41, %43
  %45 = fmul double %44, 5.000000e-01
  %46 = fsub double %39, %45
  store double %46, double* %38, align 8
  %indvars.iv.next19.1 = add nuw nsw i64 %indvars.iv18, 2
  %exitcond21.1 = icmp eq i64 %indvars.iv.next19.1, 1200
  br i1 %exitcond21.1, label %._crit_edge.us.loopexit, label %._crit_edge, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %._crit_edge
  br label %._crit_edge.us

._crit_edge.us.loopexit154:                       ; preds = %vector.body117
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit154, %._crit_edge.us.loopexit
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next23, 1000
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %exitcond25, label %.preheader1.us.preheader, label %.preheader2.us

.preheader1.us.preheader:                         ; preds = %._crit_edge.us
  br label %.preheader1.us

._crit_edge48:                                    ; preds = %._crit_edge48, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.7, %._crit_edge48 ]
  %47 = load i64, i64* %sunkaddr52, align 8
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv
  %49 = bitcast double* %48 to i64*
  store i64 %47, i64* %49, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %50 = load i64, i64* %sunkaddr52, align 8
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next
  %52 = bitcast double* %51 to i64*
  store i64 %50, i64* %52, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %53 = load i64, i64* %sunkaddr52, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.1
  %55 = bitcast double* %54 to i64*
  store i64 %53, i64* %55, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %56 = load i64, i64* %sunkaddr52, align 8
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.2
  %58 = bitcast double* %57 to i64*
  store i64 %56, i64* %58, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %59 = load i64, i64* %sunkaddr52, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.3
  %61 = bitcast double* %60 to i64*
  store i64 %59, i64* %61, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %62 = load i64, i64* %sunkaddr52, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.4
  %64 = bitcast double* %63 to i64*
  store i64 %62, i64* %64, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %65 = load i64, i64* %sunkaddr52, align 8
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.5
  %67 = bitcast double* %66 to i64*
  store i64 %65, i64* %67, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %68 = load i64, i64* %sunkaddr52, align 8
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.6
  %70 = bitcast double* %69 to i64*
  store i64 %68, i64* %70, align 8
  %indvars.iv.next.7 = add nuw nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond.7, label %.preheader2.us.preheader, label %._crit_edge48

.preheader2.us.preheader:                         ; preds = %._crit_edge48
  br label %.preheader2.us

.preheader1.us:                                   ; preds = %.preheader1.us.preheader, %._crit_edge9.us
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge9.us ], [ 0, %.preheader1.us.preheader ]
  %scevgep84 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv31, i64 2
  %71 = add nuw nsw i64 %indvars.iv31, 1
  %scevgep86 = getelementptr [1200 x double], [1200 x double]* %3, i64 %71, i64 0
  %scevgep88 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv31, i64 1
  %scevgep90 = getelementptr [1200 x double], [1200 x double]* %5, i64 %71, i64 0
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv31, i64 1
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv31, i64 1
  %75 = load double, double* %74, align 8
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv31, i64 0
  %77 = load double, double* %76, align 8
  %78 = fsub double %75, %77
  %79 = fmul double %78, 5.000000e-01
  %80 = fsub double %73, %79
  store double %80, double* %72, align 8
  %bound092 = icmp ult double* %scevgep84, %scevgep90
  %bound193 = icmp ult double* %scevgep88, %scevgep86
  %memcheck.conflict95 = and i1 %bound092, %bound193
  br i1 %memcheck.conflict95, label %scalar.ph81.preheader, label %vector.body79.preheader

vector.body79.preheader:                          ; preds = %.preheader1.us
  br label %vector.body79

scalar.ph81.preheader.loopexit:                   ; preds = %vector.body79
  br label %scalar.ph81.preheader

scalar.ph81.preheader:                            ; preds = %scalar.ph81.preheader.loopexit, %.preheader1.us
  %indvars.iv.next2854.ph = phi i64 [ 2, %.preheader1.us ], [ 1198, %scalar.ph81.preheader.loopexit ]
  %indvars.iv2753.ph = phi i64 [ 1, %.preheader1.us ], [ 1197, %scalar.ph81.preheader.loopexit ]
  br label %scalar.ph81

vector.body79:                                    ; preds = %vector.body79.preheader, %vector.body79
  %index98 = phi i64 [ %index.next99, %vector.body79 ], [ 0, %vector.body79.preheader ]
  %81 = shl i64 %index98, 1
  %offset.idx = or i64 %81, 2
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv31, i64 %offset.idx
  %83 = bitcast double* %82 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %83, align 8, !alias.scope !10, !noalias !13
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec110 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv31, i64 %offset.idx
  %85 = getelementptr double, double* %84, i64 -1
  %86 = bitcast double* %85 to <4 x double>*
  %wide.vec111 = load <4 x double>, <4 x double>* %86, align 8, !alias.scope !13
  %strided.vec112 = shufflevector <4 x double> %wide.vec111, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec113 = shufflevector <4 x double> %wide.vec111, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %87 = fsub <2 x double> %strided.vec113, %strided.vec112
  %88 = fmul <2 x double> %87, <double 5.000000e-01, double 5.000000e-01>
  %89 = fsub <2 x double> %strided.vec, %88
  %90 = or i64 %81, 3
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv31, i64 %90
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv31, i64 %90
  %93 = getelementptr double, double* %92, i64 -1
  %94 = bitcast double* %93 to <4 x double>*
  %wide.vec114 = load <4 x double>, <4 x double>* %94, align 8, !alias.scope !13
  %strided.vec115 = shufflevector <4 x double> %wide.vec114, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec116 = shufflevector <4 x double> %wide.vec114, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %95 = fsub <2 x double> %strided.vec116, %strided.vec115
  %96 = fmul <2 x double> %95, <double 5.000000e-01, double 5.000000e-01>
  %97 = fsub <2 x double> %strided.vec110, %96
  %98 = getelementptr double, double* %91, i64 -1
  %99 = bitcast double* %98 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %89, <2 x double> %97, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %99, align 8, !alias.scope !10, !noalias !13
  %index.next99 = add nuw nsw i64 %index98, 2
  %100 = icmp eq i64 %index.next99, 598
  br i1 %100, label %scalar.ph81.preheader.loopexit, label %vector.body79, !llvm.loop !15

._crit_edge9.us:                                  ; preds = %scalar.ph81
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, 1000
  br i1 %exitcond34, label %.preheader.us.preheader, label %.preheader1.us

.preheader.us.preheader:                          ; preds = %._crit_edge9.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge11.us
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %._crit_edge11.us ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv40, i64 0
  %scevgep56 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv40, i64 1199
  %scevgep58 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv40, i64 0
  %101 = add nuw nsw i64 %indvars.iv40, 1
  %scevgep60 = getelementptr [1200 x double], [1200 x double]* %3, i64 %101, i64 0
  %scevgep62 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv40, i64 0
  %scevgep64 = getelementptr [1200 x double], [1200 x double]* %4, i64 %101, i64 1199
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %bound0 = icmp ult double* %scevgep, %scevgep60
  %bound1 = icmp ult double* %scevgep58, %scevgep56
  %found.conflict = and i1 %bound0, %bound1
  %bound066 = icmp ult double* %scevgep, %scevgep64
  %bound167 = icmp ult double* %scevgep62, %scevgep56
  %found.conflict68 = and i1 %bound066, %bound167
  %conflict.rdx = or i1 %found.conflict, %found.conflict68
  br i1 %conflict.rdx, label %._crit_edge49.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %102 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv40, i64 %index
  %103 = bitcast double* %102 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %103, align 8, !alias.scope !16, !noalias !19
  %104 = getelementptr double, double* %102, i64 2
  %105 = bitcast double* %104 to <2 x double>*
  %wide.load70 = load <2 x double>, <2 x double>* %105, align 8, !alias.scope !16, !noalias !19
  %106 = or i64 %index, 1
  %107 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv40, i64 %106
  %108 = bitcast double* %107 to <2 x double>*
  %wide.load71 = load <2 x double>, <2 x double>* %108, align 8, !alias.scope !22
  %109 = getelementptr double, double* %107, i64 2
  %110 = bitcast double* %109 to <2 x double>*
  %wide.load72 = load <2 x double>, <2 x double>* %110, align 8, !alias.scope !22
  %111 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv40, i64 %index
  %112 = bitcast double* %111 to <2 x double>*
  %wide.load73 = load <2 x double>, <2 x double>* %112, align 8, !alias.scope !22
  %113 = getelementptr double, double* %111, i64 2
  %114 = bitcast double* %113 to <2 x double>*
  %wide.load74 = load <2 x double>, <2 x double>* %114, align 8, !alias.scope !22
  %115 = fsub <2 x double> %wide.load71, %wide.load73
  %116 = fsub <2 x double> %wide.load72, %wide.load74
  %117 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next41, i64 %index
  %118 = bitcast double* %117 to <2 x double>*
  %wide.load75 = load <2 x double>, <2 x double>* %118, align 8, !alias.scope !23
  %119 = getelementptr double, double* %117, i64 2
  %120 = bitcast double* %119 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %120, align 8, !alias.scope !23
  %121 = fadd <2 x double> %115, %wide.load75
  %122 = fadd <2 x double> %116, %wide.load76
  %123 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv40, i64 %index
  %124 = bitcast double* %123 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %124, align 8, !alias.scope !23
  %125 = getelementptr double, double* %123, i64 2
  %126 = bitcast double* %125 to <2 x double>*
  %wide.load78 = load <2 x double>, <2 x double>* %126, align 8, !alias.scope !23
  %127 = fsub <2 x double> %121, %wide.load77
  %128 = fsub <2 x double> %122, %wide.load78
  %129 = fmul <2 x double> %127, <double 7.000000e-01, double 7.000000e-01>
  %130 = fmul <2 x double> %128, <double 7.000000e-01, double 7.000000e-01>
  %131 = fsub <2 x double> %wide.load, %129
  %132 = fsub <2 x double> %wide.load70, %130
  %133 = bitcast double* %102 to <2 x double>*
  store <2 x double> %131, <2 x double>* %133, align 8, !alias.scope !16, !noalias !19
  %134 = bitcast double* %104 to <2 x double>*
  store <2 x double> %132, <2 x double>* %134, align 8, !alias.scope !16, !noalias !19
  %index.next = add nuw nsw i64 %index, 4
  %135 = icmp eq i64 %index.next, 1196
  br i1 %135, label %._crit_edge49.preheader.loopexit, label %vector.body, !llvm.loop !24

._crit_edge49.preheader.loopexit:                 ; preds = %vector.body
  br label %._crit_edge49.preheader

._crit_edge49.preheader:                          ; preds = %._crit_edge49.preheader.loopexit, %.preheader.us
  %indvars.iv36.ph = phi i64 [ 0, %.preheader.us ], [ 1196, %._crit_edge49.preheader.loopexit ]
  br label %._crit_edge49

._crit_edge49:                                    ; preds = %._crit_edge49.preheader, %._crit_edge49
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge49 ], [ %indvars.iv36.ph, %._crit_edge49.preheader ]
  %136 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv36
  %137 = load double, double* %136, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv40, i64 %indvars.iv.next37
  %139 = load double, double* %138, align 8
  %140 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv40, i64 %indvars.iv36
  %141 = load double, double* %140, align 8
  %142 = fsub double %139, %141
  %143 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next41, i64 %indvars.iv36
  %144 = load double, double* %143, align 8
  %145 = fadd double %142, %144
  %146 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv40, i64 %indvars.iv36
  %147 = load double, double* %146, align 8
  %148 = fsub double %145, %147
  %149 = fmul double %148, 7.000000e-01
  %150 = fsub double %137, %149
  store double %150, double* %136, align 8
  %exitcond39 = icmp eq i64 %indvars.iv.next37, 1199
  br i1 %exitcond39, label %._crit_edge11.us, label %._crit_edge49, !llvm.loop !25

._crit_edge11.us:                                 ; preds = %._crit_edge49
  %exitcond43 = icmp eq i64 %indvars.iv.next41, 999
  br i1 %exitcond43, label %._crit_edge12, label %.preheader.us

._crit_edge12:                                    ; preds = %._crit_edge11.us
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next45, 500
  br i1 %exitcond47, label %._crit_edge13, label %.lr.ph

._crit_edge13:                                    ; preds = %._crit_edge12
  ret void

scalar.ph81:                                      ; preds = %scalar.ph81.preheader, %scalar.ph81
  %indvars.iv.next2854 = phi i64 [ %indvars.iv.next28, %scalar.ph81 ], [ %indvars.iv.next2854.ph, %scalar.ph81.preheader ]
  %indvars.iv2753 = phi i64 [ %indvars.iv.next28.1, %scalar.ph81 ], [ %indvars.iv2753.ph, %scalar.ph81.preheader ]
  %151 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv31, i64 %indvars.iv.next2854
  %152 = load double, double* %151, align 8
  %153 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv31, i64 %indvars.iv.next2854
  %154 = load double, double* %153, align 8
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv31, i64 %indvars.iv2753
  %156 = load double, double* %155, align 8
  %157 = fsub double %154, %156
  %158 = fmul double %157, 5.000000e-01
  %159 = fsub double %152, %158
  store double %159, double* %151, align 8
  %indvars.iv.next28.1 = add nuw nsw i64 %indvars.iv2753, 2
  %160 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv31, i64 %indvars.iv.next28.1
  %161 = load double, double* %160, align 8
  %162 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv31, i64 %indvars.iv.next28.1
  %163 = load double, double* %162, align 8
  %164 = add nuw nsw i64 %indvars.iv2753, 1
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv31, i64 %164
  %166 = load double, double* %165, align 8
  %167 = fsub double %163, %166
  %168 = fmul double %167, 5.000000e-01
  %169 = fsub double %161, %168
  store double %169, double* %160, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv2753, 3
  %exitcond30 = icmp eq i64 %indvars.iv.next28, 1200
  br i1 %exitcond30, label %._crit_edge9.us, label %scalar.ph81, !llvm.loop !26
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*) #0 {
.preheader8.us.preheader:
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %._crit_edge14.us, %.preheader8.us.preheader
  %indvars.iv37 = phi i64 [ 0, %.preheader8.us.preheader ], [ %indvars.iv.next38, %._crit_edge14.us ]
  %9 = mul nuw nsw i64 %indvars.iv37, 1000
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge, %.preheader8.us
  %indvars.iv33 = phi i64 [ 0, %.preheader8.us ], [ %indvars.iv.next34, %._crit_edge ]
  %10 = add nuw nsw i64 %indvars.iv33, %9
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %._crit_edge42
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge42, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv33
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, 1200
  br i1 %exitcond36, label %._crit_edge14.us, label %._crit_edge42

._crit_edge14.us:                                 ; preds = %._crit_edge
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, 1000
  br i1 %exitcond40, label %.preheader7.us.preheader, label %.preheader8.us

.preheader7.us.preheader:                         ; preds = %._crit_edge14.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #4
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge11.us, %.preheader7.us.preheader
  %indvars.iv28 = phi i64 [ 0, %.preheader7.us.preheader ], [ %indvars.iv.next29, %._crit_edge11.us ]
  %26 = mul nuw nsw i64 %indvars.iv28, 1000
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %._crit_edge43, %.preheader7.us
  %indvars.iv24 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next25, %._crit_edge43 ]
  %27 = add nuw nsw i64 %indvars.iv24, %26
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 20
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %31, label %._crit_edge43

; <label>:31:                                     ; preds = %._crit_edge44
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %32) #4
  br label %._crit_edge43

._crit_edge43:                                    ; preds = %._crit_edge44, %31
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv28, i64 %indvars.iv24
  %35 = load double, double* %34, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %35) #5
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next25, 1200
  br i1 %exitcond27, label %._crit_edge11.us, label %._crit_edge44

._crit_edge11.us:                                 ; preds = %._crit_edge43
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next29, 1000
  br i1 %exitcond31, label %.preheader.us.preheader, label %.preheader7.us

.preheader.us.preheader:                          ; preds = %._crit_edge11.us
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv19 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next20, %._crit_edge.us ]
  %41 = mul nuw nsw i64 %indvars.iv19, 1000
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %._crit_edge45, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge45 ]
  %42 = add nuw nsw i64 %indvars.iv, %41
  %43 = trunc i64 %42 to i32
  %44 = srem i32 %43, 20
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %46, label %._crit_edge45

; <label>:46:                                     ; preds = %._crit_edge46
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %47) #4
  br label %._crit_edge45

._crit_edge45:                                    ; preds = %._crit_edge46, %46
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv19, i64 %indvars.iv
  %50 = load double, double* %49, align 8
  %51 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %50) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge46

._crit_edge.us:                                   ; preds = %._crit_edge45
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, 1000
  br i1 %exitcond22, label %._crit_edge9, label %.preheader.us

._crit_edge9:                                     ; preds = %._crit_edge.us
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %53 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %52, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

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
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = !{!17}
!17 = distinct !{!17, !18}
!18 = distinct !{!18, !"LVerDomain"}
!19 = !{!20, !21}
!20 = distinct !{!20, !18}
!21 = distinct !{!21, !18}
!22 = !{!20}
!23 = !{!21}
!24 = distinct !{!24, !7, !8}
!25 = distinct !{!25, !7, !8}
!26 = distinct !{!26, !7, !8}
