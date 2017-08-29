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
  tail call void @init_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #3
  tail call void @kernel_fdtd_2d([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
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
  tail call void @print_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9)
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
define internal void @init_array([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #0 {
.lr.ph5.preheader:
  br label %.lr.ph5

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %4 = trunc i64 %indvars.iv7 to i32
  %5 = sitofp i32 %4 to double
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %8 = trunc i64 %indvars.iv.next to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv
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
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv7, i64 %indvars.iv
  store double %19, double* %20, align 8
  %21 = add nuw nsw i64 %indvars.iv, 3
  %22 = trunc i64 %21 to i32
  %23 = sitofp i32 %22 to double
  %24 = fmul double %5, %23
  %25 = fdiv double %24, 1.000000e+03
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv
  store double %25, double* %26, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1199
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond14, label %._crit_edge3, label %.preheader.us

.lr.ph5:                                          ; preds = %.lr.ph5, %.lr.ph5.preheader
  %indvars.iv10 = phi i64 [ 0, %.lr.ph5.preheader ], [ %indvars.iv.next11.4, %.lr.ph5 ]
  %27 = trunc i64 %indvars.iv10 to i32
  %28 = sitofp i32 %27 to double
  %29 = getelementptr inbounds double, double* %3, i64 %indvars.iv10
  store double %28, double* %29, align 8
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %30 = trunc i64 %indvars.iv.next11 to i32
  %31 = sitofp i32 %30 to double
  %32 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next11
  store double %31, double* %32, align 8
  %indvars.iv.next11.1 = add nsw i64 %indvars.iv10, 2
  %33 = trunc i64 %indvars.iv.next11.1 to i32
  %34 = sitofp i32 %33 to double
  %35 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next11.1
  store double %34, double* %35, align 8
  %indvars.iv.next11.2 = add nsw i64 %indvars.iv10, 3
  %36 = trunc i64 %indvars.iv.next11.2 to i32
  %37 = sitofp i32 %36 to double
  %38 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next11.2
  store double %37, double* %38, align 8
  %indvars.iv.next11.3 = add nsw i64 %indvars.iv10, 4
  %39 = trunc i64 %indvars.iv.next11.3 to i32
  %40 = sitofp i32 %39 to double
  %41 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next11.3
  store double %40, double* %41, align 8
  %exitcond13.4 = icmp eq i64 %indvars.iv.next11.3, 499
  %indvars.iv.next11.4 = add nsw i64 %indvars.iv10, 5
  br i1 %exitcond13.4, label %.preheader.us.preheader, label %.lr.ph5

.preheader.us.preheader:                          ; preds = %.lr.ph5
  br label %.preheader.us

._crit_edge3:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_fdtd_2d([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #0 {
.preheader6.lr.ph:
  %sunkaddr = ptrtoint double* %3 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge12, %.preheader6.lr.ph
  %indvars.iv41 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next42, %._crit_edge12 ]
  %sunkaddr50 = shl nuw nsw i64 %indvars.iv41, 3
  %sunkaddr51 = add i64 %sunkaddr, %sunkaddr50
  %sunkaddr52 = inttoptr i64 %sunkaddr51 to i64*
  br label %44

.preheader2.us:                                   ; preds = %.preheader2.us.preheader, %._crit_edge.us
  %indvar = phi i64 [ %4, %._crit_edge.us ], [ 0, %.preheader2.us.preheader ]
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %._crit_edge.us ], [ 1, %.preheader2.us.preheader ]
  %4 = add nuw nsw i64 %indvar, 1
  %scevgep115 = getelementptr [1200 x double], [1200 x double]* %1, i64 %4, i64 0
  %5 = add nuw nsw i64 %indvar, 2
  %scevgep117 = getelementptr [1200 x double], [1200 x double]* %1, i64 %5, i64 0
  %scevgep119 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvar, i64 0
  %scevgep121 = getelementptr [1200 x double], [1200 x double]* %2, i64 %5, i64 0
  %6 = add nsw i64 %indvars.iv25, -1
  %bound0123 = icmp ult double* %scevgep115, %scevgep121
  %bound1124 = icmp ult double* %scevgep119, %scevgep117
  %memcheck.conflict126 = and i1 %bound0123, %bound1124
  br i1 %memcheck.conflict126, label %scalar.ph112.preheader, label %vector.body110.preheader

vector.body110.preheader:                         ; preds = %.preheader2.us
  br label %vector.body110

scalar.ph112.preheader:                           ; preds = %.preheader2.us
  br label %scalar.ph112

vector.body110:                                   ; preds = %vector.body110.preheader, %vector.body110
  %index129 = phi i64 [ %index.next130, %vector.body110 ], [ 0, %vector.body110.preheader ]
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv25, i64 %index129
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load137 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !1, !noalias !4
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load138 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !1, !noalias !4
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 %index129
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load139 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !4
  %13 = getelementptr double, double* %11, i64 2
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load140 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !4
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %6, i64 %index129
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load141 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !4
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load142 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !4
  %19 = fsub <2 x double> %wide.load139, %wide.load141
  %20 = fsub <2 x double> %wide.load140, %wide.load142
  %21 = fmul <2 x double> %19, <double 5.000000e-01, double 5.000000e-01>
  %22 = fmul <2 x double> %20, <double 5.000000e-01, double 5.000000e-01>
  %23 = fsub <2 x double> %wide.load137, %21
  %24 = fsub <2 x double> %wide.load138, %22
  store <2 x double> %23, <2 x double>* %8, align 8, !alias.scope !1, !noalias !4
  store <2 x double> %24, <2 x double>* %10, align 8, !alias.scope !1, !noalias !4
  %index.next130 = add nuw nsw i64 %index129, 4
  %25 = icmp eq i64 %index.next130, 1200
  br i1 %25, label %._crit_edge.us.loopexit2, label %vector.body110, !llvm.loop !6

scalar.ph112:                                     ; preds = %scalar.ph112, %scalar.ph112.preheader
  %indvars.iv21 = phi i64 [ 0, %scalar.ph112.preheader ], [ %indvars.iv.next22.1, %scalar.ph112 ]
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv21
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 %indvars.iv21
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %6, i64 %indvars.iv21
  %31 = load double, double* %30, align 8
  %32 = fsub double %29, %31
  %33 = fmul double %32, 5.000000e-01
  %34 = fsub double %27, %33
  store double %34, double* %26, align 8
  %indvars.iv.next22 = or i64 %indvars.iv21, 1
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv.next22
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 %indvars.iv.next22
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %6, i64 %indvars.iv.next22
  %40 = load double, double* %39, align 8
  %41 = fsub double %38, %40
  %42 = fmul double %41, 5.000000e-01
  %43 = fsub double %36, %42
  store double %43, double* %35, align 8
  %exitcond24.1 = icmp eq i64 %indvars.iv.next22, 1199
  %indvars.iv.next22.1 = add nsw i64 %indvars.iv21, 2
  br i1 %exitcond24.1, label %._crit_edge.us.loopexit, label %scalar.ph112, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph112
  br label %._crit_edge.us

._crit_edge.us.loopexit2:                         ; preds = %vector.body110
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit2, %._crit_edge.us.loopexit
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond143 = icmp eq i64 %4, 999
  br i1 %exitcond143, label %.preheader1.us.preheader, label %.preheader2.us

.preheader1.us.preheader:                         ; preds = %._crit_edge.us
  br label %.preheader1.us

; <label>:44:                                     ; preds = %44, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.4, %44 ]
  %45 = load i64, i64* %sunkaddr52, align 8
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv
  %47 = bitcast double* %46 to i64*
  store i64 %45, i64* %47, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %48 = load i64, i64* %sunkaddr52, align 8
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next
  %50 = bitcast double* %49 to i64*
  store i64 %48, i64* %50, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %51 = load i64, i64* %sunkaddr52, align 8
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.1
  %53 = bitcast double* %52 to i64*
  store i64 %51, i64* %53, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %54 = load i64, i64* %sunkaddr52, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.2
  %56 = bitcast double* %55 to i64*
  store i64 %54, i64* %56, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %57 = load i64, i64* %sunkaddr52, align 8
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.3
  %59 = bitcast double* %58 to i64*
  store i64 %57, i64* %59, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1199
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %.preheader2.us.preheader, label %44

.preheader2.us.preheader:                         ; preds = %44
  br label %.preheader2.us

.preheader1.us:                                   ; preds = %.preheader1.us.preheader, %._crit_edge9.us
  %indvars.iv32 = phi i64 [ %60, %._crit_edge9.us ], [ 0, %.preheader1.us.preheader ]
  %scevgep82 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv32, i64 1
  %60 = add nuw nsw i64 %indvars.iv32, 1
  %scevgep84 = getelementptr [1200 x double], [1200 x double]* %0, i64 %60, i64 0
  %scevgep86 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 0
  %scevgep88 = getelementptr [1200 x double], [1200 x double]* %2, i64 %60, i64 0
  %bound090 = icmp ult double* %scevgep82, %scevgep88
  %bound191 = icmp ult double* %scevgep86, %scevgep84
  %memcheck.conflict93 = and i1 %bound090, %bound191
  br i1 %memcheck.conflict93, label %scalar.ph79.preheader.new, label %vector.body77.preheader

vector.body77.preheader:                          ; preds = %.preheader1.us
  br label %vector.body77

vector.body77:                                    ; preds = %vector.body77.preheader, %vector.body77
  %index96 = phi i64 [ %index.next97, %vector.body77 ], [ 0, %vector.body77.preheader ]
  %offset.idx = or i64 %index96, 1
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv32, i64 %offset.idx
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load104 = load <2 x double>, <2 x double>* %62, align 8, !alias.scope !10, !noalias !13
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load105 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !10, !noalias !13
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %offset.idx
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load106 = load <2 x double>, <2 x double>* %66, align 8, !alias.scope !13
  %67 = getelementptr double, double* %65, i64 2
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load107 = load <2 x double>, <2 x double>* %68, align 8, !alias.scope !13
  %69 = add nsw i64 %offset.idx, -1
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %69
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load108 = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !13
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load109 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !13
  %74 = fsub <2 x double> %wide.load106, %wide.load108
  %75 = fsub <2 x double> %wide.load107, %wide.load109
  %76 = fmul <2 x double> %74, <double 5.000000e-01, double 5.000000e-01>
  %77 = fmul <2 x double> %75, <double 5.000000e-01, double 5.000000e-01>
  %78 = fsub <2 x double> %wide.load104, %76
  %79 = fsub <2 x double> %wide.load105, %77
  store <2 x double> %78, <2 x double>* %62, align 8, !alias.scope !10, !noalias !13
  store <2 x double> %79, <2 x double>* %64, align 8, !alias.scope !10, !noalias !13
  %index.next97 = add nuw nsw i64 %index96, 4
  %80 = icmp eq i64 %index.next97, 1196
  br i1 %80, label %scalar.ph79.preheader.new.loopexit, label %vector.body77, !llvm.loop !15

scalar.ph79.preheader.new.loopexit:               ; preds = %vector.body77
  br label %scalar.ph79.preheader.new

scalar.ph79.preheader.new:                        ; preds = %scalar.ph79.preheader.new.loopexit, %.preheader1.us
  %indvars.iv28.ph = phi i64 [ 1, %.preheader1.us ], [ 1197, %scalar.ph79.preheader.new.loopexit ]
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv32, i64 %indvars.iv28.ph
  %82 = load double, double* %81, align 8
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %indvars.iv28.ph
  %84 = load double, double* %83, align 8
  %85 = add nsw i64 %indvars.iv28.ph, -1
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %85
  %87 = load double, double* %86, align 8
  %88 = fsub double %84, %87
  %89 = fmul double %88, 5.000000e-01
  %90 = fsub double %82, %89
  store double %90, double* %81, align 8
  %indvars.iv.next29.prol = add nuw nsw i64 %indvars.iv28.ph, 1
  br label %scalar.ph79

scalar.ph79:                                      ; preds = %scalar.ph79, %scalar.ph79.preheader.new
  %indvars.iv28 = phi i64 [ %indvars.iv.next29.prol, %scalar.ph79.preheader.new ], [ %indvars.iv.next29.1, %scalar.ph79 ]
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv32, i64 %indvars.iv28
  %92 = load double, double* %91, align 8
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %indvars.iv28
  %94 = load double, double* %93, align 8
  %95 = add nsw i64 %indvars.iv28, -1
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %95
  %97 = load double, double* %96, align 8
  %98 = fsub double %94, %97
  %99 = fmul double %98, 5.000000e-01
  %100 = fsub double %92, %99
  store double %100, double* %91, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv32, i64 %indvars.iv.next29
  %102 = load double, double* %101, align 8
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %indvars.iv.next29
  %104 = load double, double* %103, align 8
  %105 = load double, double* %93, align 8
  %106 = fsub double %104, %105
  %107 = fmul double %106, 5.000000e-01
  %108 = fsub double %102, %107
  store double %108, double* %101, align 8
  %exitcond31.1 = icmp eq i64 %indvars.iv.next29, 1199
  %indvars.iv.next29.1 = add nsw i64 %indvars.iv28, 2
  br i1 %exitcond31.1, label %._crit_edge9.us, label %scalar.ph79, !llvm.loop !16

._crit_edge9.us:                                  ; preds = %scalar.ph79
  %exitcond144 = icmp eq i64 %60, 1000
  br i1 %exitcond144, label %.preheader.us.preheader, label %.preheader1.us

.preheader.us.preheader:                          ; preds = %._crit_edge9.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge11.us
  %indvars.iv39 = phi i64 [ %109, %._crit_edge11.us ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 0
  %scevgep54 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 1199
  %scevgep56 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv39, i64 0
  %109 = add nuw nsw i64 %indvars.iv39, 1
  %scevgep58 = getelementptr [1200 x double], [1200 x double]* %0, i64 %109, i64 0
  %scevgep60 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv39, i64 0
  %scevgep62 = getelementptr [1200 x double], [1200 x double]* %1, i64 %109, i64 1199
  %bound0 = icmp ult double* %scevgep, %scevgep58
  %bound1 = icmp ult double* %scevgep56, %scevgep54
  %found.conflict = and i1 %bound0, %bound1
  %bound064 = icmp ult double* %scevgep, %scevgep62
  %bound165 = icmp ult double* %scevgep60, %scevgep54
  %found.conflict66 = and i1 %bound064, %bound165
  %conflict.rdx = or i1 %found.conflict, %found.conflict66
  br i1 %conflict.rdx, label %._crit_edge19.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %110 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 %index
  %111 = bitcast double* %110 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %111, align 8, !alias.scope !17, !noalias !20
  %112 = getelementptr double, double* %110, i64 2
  %113 = bitcast double* %112 to <2 x double>*
  %wide.load68 = load <2 x double>, <2 x double>* %113, align 8, !alias.scope !17, !noalias !20
  %114 = or i64 %index, 1
  %115 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv39, i64 %114
  %116 = bitcast double* %115 to <2 x double>*
  %wide.load69 = load <2 x double>, <2 x double>* %116, align 8, !alias.scope !23
  %117 = getelementptr double, double* %115, i64 2
  %118 = bitcast double* %117 to <2 x double>*
  %wide.load70 = load <2 x double>, <2 x double>* %118, align 8, !alias.scope !23
  %119 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv39, i64 %index
  %120 = bitcast double* %119 to <2 x double>*
  %wide.load71 = load <2 x double>, <2 x double>* %120, align 8, !alias.scope !23
  %121 = getelementptr double, double* %119, i64 2
  %122 = bitcast double* %121 to <2 x double>*
  %wide.load72 = load <2 x double>, <2 x double>* %122, align 8, !alias.scope !23
  %123 = fsub <2 x double> %wide.load69, %wide.load71
  %124 = fsub <2 x double> %wide.load70, %wide.load72
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %109, i64 %index
  %126 = bitcast double* %125 to <2 x double>*
  %wide.load73 = load <2 x double>, <2 x double>* %126, align 8, !alias.scope !24
  %127 = getelementptr double, double* %125, i64 2
  %128 = bitcast double* %127 to <2 x double>*
  %wide.load74 = load <2 x double>, <2 x double>* %128, align 8, !alias.scope !24
  %129 = fadd <2 x double> %123, %wide.load73
  %130 = fadd <2 x double> %124, %wide.load74
  %131 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv39, i64 %index
  %132 = bitcast double* %131 to <2 x double>*
  %wide.load75 = load <2 x double>, <2 x double>* %132, align 8, !alias.scope !24
  %133 = getelementptr double, double* %131, i64 2
  %134 = bitcast double* %133 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %134, align 8, !alias.scope !24
  %135 = fsub <2 x double> %129, %wide.load75
  %136 = fsub <2 x double> %130, %wide.load76
  %137 = fmul <2 x double> %135, <double 7.000000e-01, double 7.000000e-01>
  %138 = fmul <2 x double> %136, <double 7.000000e-01, double 7.000000e-01>
  %139 = fsub <2 x double> %wide.load, %137
  %140 = fsub <2 x double> %wide.load68, %138
  store <2 x double> %139, <2 x double>* %111, align 8, !alias.scope !17, !noalias !20
  store <2 x double> %140, <2 x double>* %113, align 8, !alias.scope !17, !noalias !20
  %index.next = add nuw nsw i64 %index, 4
  %141 = icmp eq i64 %index.next, 1196
  br i1 %141, label %._crit_edge19.preheader.loopexit, label %vector.body, !llvm.loop !25

._crit_edge19.preheader.loopexit:                 ; preds = %vector.body
  br label %._crit_edge19.preheader

._crit_edge19.preheader:                          ; preds = %._crit_edge19.preheader.loopexit, %.preheader.us
  %indvars.iv35.ph = phi i64 [ 0, %.preheader.us ], [ 1196, %._crit_edge19.preheader.loopexit ]
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.preheader, %._crit_edge19
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge19 ], [ %indvars.iv35.ph, %._crit_edge19.preheader ]
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv35
  %143 = load double, double* %142, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv39, i64 %indvars.iv.next36
  %145 = load double, double* %144, align 8
  %146 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv39, i64 %indvars.iv35
  %147 = load double, double* %146, align 8
  %148 = fsub double %145, %147
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %109, i64 %indvars.iv35
  %150 = load double, double* %149, align 8
  %151 = fadd double %148, %150
  %152 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv39, i64 %indvars.iv35
  %153 = load double, double* %152, align 8
  %154 = fsub double %151, %153
  %155 = fmul double %154, 7.000000e-01
  %156 = fsub double %143, %155
  store double %156, double* %142, align 8
  %exitcond38 = icmp eq i64 %indvars.iv35, 1198
  br i1 %exitcond38, label %._crit_edge11.us, label %._crit_edge19, !llvm.loop !26

._crit_edge11.us:                                 ; preds = %._crit_edge19
  %exitcond145 = icmp eq i64 %109, 999
  br i1 %exitcond145, label %._crit_edge12, label %.preheader.us

._crit_edge12:                                    ; preds = %._crit_edge11.us
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond146 = icmp eq i64 %indvars.iv.next42, 500
  br i1 %exitcond146, label %._crit_edge13, label %.lr.ph

._crit_edge13:                                    ; preds = %._crit_edge12
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]*, [1200 x double]*, [1200 x double]*) #0 {
.preheader10.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader10.us

.preheader10.us:                                  ; preds = %._crit_edge17.us, %.preheader10.us.preheader
  %indvars.iv31 = phi i64 [ 0, %.preheader10.us.preheader ], [ %indvars.iv.next32, %._crit_edge17.us ]
  %7 = mul nuw nsw i64 %indvars.iv31, 1000
  br label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us, %.preheader10.us
  %indvars.iv29 = phi i64 [ 0, %.preheader10.us ], [ %indvars.iv.next30, %._crit_edge.us ]
  %8 = add nuw nsw i64 %indvars.iv29, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge.us

; <label>:12:                                     ; preds = %._crit_edge.us._crit_edge
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc8.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #4
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us._crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv31, i64 %indvars.iv29
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next30, 1200
  br i1 %exitcond39, label %._crit_edge17.us, label %._crit_edge.us._crit_edge

._crit_edge17.us:                                 ; preds = %._crit_edge.us
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next32, 1000
  br i1 %exitcond40, label %.preheader9.us.preheader, label %.preheader10.us

.preheader9.us.preheader:                         ; preds = %._crit_edge17.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #4
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %._crit_edge14.us, %.preheader9.us.preheader
  %indvars.iv26 = phi i64 [ 0, %.preheader9.us.preheader ], [ %indvars.iv.next27, %._crit_edge14.us ]
  %24 = mul nuw nsw i64 %indvars.iv26, 1000
  br label %._crit_edge1.us._crit_edge

._crit_edge1.us._crit_edge:                       ; preds = %._crit_edge1.us, %.preheader9.us
  %indvars.iv24 = phi i64 [ 0, %.preheader9.us ], [ %indvars.iv.next25, %._crit_edge1.us ]
  %25 = add nuw nsw i64 %indvars.iv24, %24
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 20
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %._crit_edge1.us

; <label>:29:                                     ; preds = %._crit_edge1.us._crit_edge
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc5.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %30) #4
  br label %._crit_edge1.us

._crit_edge1.us:                                  ; preds = %._crit_edge1.us._crit_edge, %29
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv24
  %33 = load double, double* %32, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %33) #5
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next25, 1200
  br i1 %exitcond37, label %._crit_edge14.us, label %._crit_edge1.us._crit_edge

._crit_edge14.us:                                 ; preds = %._crit_edge1.us
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next27, 1000
  br i1 %exitcond38, label %.preheader.us.preheader, label %.preheader9.us

.preheader.us.preheader:                          ; preds = %._crit_edge14.us
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge11.us, %.preheader.us.preheader
  %indvars.iv22 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next23, %._crit_edge11.us ]
  %39 = mul nuw nsw i64 %indvars.iv22, 1000
  br label %._crit_edge2.us._crit_edge

._crit_edge2.us._crit_edge:                       ; preds = %._crit_edge2.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %40 = add nuw nsw i64 %indvars.iv, %39
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, 20
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %._crit_edge2.us

; <label>:44:                                     ; preds = %._crit_edge2.us._crit_edge
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %45) #4
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %._crit_edge2.us._crit_edge, %44
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv22, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %48) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge11.us, label %._crit_edge2.us._crit_edge

._crit_edge11.us:                                 ; preds = %._crit_edge2.us
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next23, 1000
  br i1 %exitcond36, label %._crit_edge12, label %.preheader.us

._crit_edge12:                                    ; preds = %._crit_edge11.us
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
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
!16 = distinct !{!16, !7, !8}
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21, !22}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !19}
!23 = !{!21}
!24 = !{!22}
!25 = distinct !{!25, !7, !8}
!26 = distinct !{!26, !7, !8}
