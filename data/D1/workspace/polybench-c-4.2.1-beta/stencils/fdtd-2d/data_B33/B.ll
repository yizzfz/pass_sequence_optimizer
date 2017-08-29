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
  tail call fastcc void @init_array(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_fdtd_2d(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
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
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %18, [1200 x double]* %17, [1200 x double]* %16)
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
define internal fastcc void @init_array(i32, i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*, double*) unnamed_addr #0 {
  br label %8

; <label>:8:                                      ; preds = %8, %7
  %indvars.iv9 = phi i64 [ 0, %7 ], [ %indvars.iv.next10.4, %8 ]
  %9 = trunc i64 %indvars.iv9 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds double, double* %6, i64 %indvars.iv9
  %12 = bitcast double* %11 to <2 x double>*
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %13 = trunc i64 %indvars.iv.next10 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %10, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  store <2 x double> %16, <2 x double>* %12, align 8
  %indvars.iv.next10.1 = add nsw i64 %indvars.iv9, 2
  %17 = trunc i64 %indvars.iv.next10.1 to i32
  %18 = sitofp i32 %17 to double
  %19 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next10.1
  %20 = bitcast double* %19 to <2 x double>*
  %indvars.iv.next10.2 = add nsw i64 %indvars.iv9, 3
  %21 = trunc i64 %indvars.iv.next10.2 to i32
  %22 = sitofp i32 %21 to double
  %23 = insertelement <2 x double> undef, double %18, i32 0
  %24 = insertelement <2 x double> %23, double %22, i32 1
  store <2 x double> %24, <2 x double>* %20, align 8
  %indvars.iv.next10.3 = add nsw i64 %indvars.iv9, 4
  %25 = trunc i64 %indvars.iv.next10.3 to i32
  %26 = sitofp i32 %25 to double
  %27 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next10.3
  store double %26, double* %27, align 8
  %indvars.iv.next10.4 = add nsw i64 %indvars.iv9, 5
  %exitcond11.4 = icmp eq i64 %indvars.iv.next10.4, 500
  br i1 %exitcond11.4, label %.preheader.preheader, label %8

.preheader.preheader:                             ; preds = %8
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %52
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %52 ], [ 0, %.preheader.preheader ]
  %28 = trunc i64 %indvars.iv6 to i32
  %29 = sitofp i32 %28 to double
  %30 = insertelement <2 x double> undef, double %29, i32 0
  %31 = shufflevector <2 x double> %30, <2 x double> undef, <2 x i32> zeroinitializer
  br label %32

; <label>:32:                                     ; preds = %32, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %32 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %33 = trunc i64 %indvars.iv.next to i32
  %34 = sitofp i32 %33 to double
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv6, i64 %indvars.iv
  %36 = add nuw nsw i64 %indvars.iv, 2
  %37 = trunc i64 %36 to i32
  %38 = sitofp i32 %37 to double
  %39 = insertelement <2 x double> undef, double %34, i32 0
  %40 = insertelement <2 x double> %39, double %38, i32 1
  %41 = fmul <2 x double> %31, %40
  %42 = fdiv <2 x double> %41, <double 1.000000e+03, double 1.200000e+03>
  %43 = extractelement <2 x double> %42, i32 0
  %44 = extractelement <2 x double> %42, i32 1
  store double %43, double* %35, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv6, i64 %indvars.iv
  store double %44, double* %45, align 8
  %46 = add nuw nsw i64 %indvars.iv, 3
  %47 = trunc i64 %46 to i32
  %48 = sitofp i32 %47 to double
  %49 = fmul double %29, %48
  %50 = fdiv double %49, 1.000000e+03
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv6, i64 %indvars.iv
  store double %50, double* %51, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %52, label %32

; <label>:52:                                     ; preds = %32
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 1000
  br i1 %exitcond8, label %53, label %.preheader

; <label>:53:                                     ; preds = %52
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_fdtd_2d(i32, i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*, double*) unnamed_addr #0 {
  %sunkaddr = ptrtoint double* %6 to i64
  br label %.preheader13

.preheader13:                                     ; preds = %153, %7
  %indvars.iv34 = phi i64 [ 0, %7 ], [ %indvars.iv.next35, %153 ]
  %sunkaddr140 = shl i64 %indvars.iv34, 3
  %sunkaddr141 = add i64 %sunkaddr, %sunkaddr140
  %sunkaddr142 = inttoptr i64 %sunkaddr141 to i64*
  br label %8

; <label>:8:                                      ; preds = %8, %.preheader13
  %indvars.iv = phi i64 [ 0, %.preheader13 ], [ %indvars.iv.next.7, %8 ]
  %9 = load i64, i64* %sunkaddr142, align 8
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv
  %11 = bitcast double* %10 to i64*
  store i64 %9, i64* %11, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %12 = load i64, i64* %sunkaddr142, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next
  %14 = bitcast double* %13 to i64*
  store i64 %12, i64* %14, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %15 = load i64, i64* %sunkaddr142, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.1
  %17 = bitcast double* %16 to i64*
  store i64 %15, i64* %17, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %18 = load i64, i64* %sunkaddr142, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.2
  %20 = bitcast double* %19 to i64*
  store i64 %18, i64* %20, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %21 = load i64, i64* %sunkaddr142, align 8
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.3
  %23 = bitcast double* %22 to i64*
  store i64 %21, i64* %23, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %24 = load i64, i64* %sunkaddr142, align 8
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.4
  %26 = bitcast double* %25 to i64*
  store i64 %24, i64* %26, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %27 = load i64, i64* %sunkaddr142, align 8
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.5
  %29 = bitcast double* %28 to i64*
  store i64 %27, i64* %29, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %30 = load i64, i64* %sunkaddr142, align 8
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.6
  %32 = bitcast double* %31 to i64*
  store i64 %30, i64* %32, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond.7, label %vector.memcheck118.preheader, label %8

vector.memcheck118.preheader:                     ; preds = %8
  br label %vector.memcheck118

vector.memcheck118:                               ; preds = %vector.memcheck118.preheader, %middle.block102
  %indvar = phi i64 [ %indvar.next, %middle.block102 ], [ 0, %vector.memcheck118.preheader ]
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %middle.block102 ], [ 1, %vector.memcheck118.preheader ]
  %33 = add i64 %indvar, 1
  %scevgep106 = getelementptr [1200 x double], [1200 x double]* %4, i64 %33, i64 0
  %34 = add i64 %indvar, 2
  %scevgep108 = getelementptr [1200 x double], [1200 x double]* %4, i64 %34, i64 0
  %scevgep110 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvar, i64 0
  %scevgep112 = getelementptr [1200 x double], [1200 x double]* %5, i64 %34, i64 0
  %35 = add nsw i64 %indvars.iv20, -1
  %bound0114 = icmp ult double* %scevgep106, %scevgep112
  %bound1115 = icmp ult double* %scevgep110, %scevgep108
  %memcheck.conflict117 = and i1 %bound0114, %bound1115
  br i1 %memcheck.conflict117, label %scalar.ph103.preheader, label %vector.body101.preheader

vector.body101.preheader:                         ; preds = %vector.memcheck118
  br label %vector.body101

scalar.ph103.preheader:                           ; preds = %vector.memcheck118
  br label %scalar.ph103

vector.body101:                                   ; preds = %vector.body101.preheader, %vector.body101
  %index120 = phi i64 [ %index.next121, %vector.body101 ], [ 0, %vector.body101.preheader ]
  %offset.idx124 = shl i64 %index120, 1
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv20, i64 %offset.idx124
  %37 = bitcast double* %36 to <4 x double>*
  %wide.vec128 = load <4 x double>, <4 x double>* %37, align 8, !alias.scope !1, !noalias !4
  %strided.vec129 = shufflevector <4 x double> %wide.vec128, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec130 = shufflevector <4 x double> %wide.vec128, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv20, i64 %offset.idx124
  %39 = bitcast double* %38 to <4 x double>*
  %wide.vec131 = load <4 x double>, <4 x double>* %39, align 8, !alias.scope !4
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %35, i64 %offset.idx124
  %41 = bitcast double* %40 to <4 x double>*
  %wide.vec134 = load <4 x double>, <4 x double>* %41, align 8, !alias.scope !4
  %42 = fsub <4 x double> %wide.vec131, %wide.vec134
  %43 = shufflevector <4 x double> %42, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %44 = fmul <2 x double> %43, <double 5.000000e-01, double 5.000000e-01>
  %45 = fsub <2 x double> %strided.vec129, %44
  %46 = or i64 %offset.idx124, 1
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv20, i64 %46
  %48 = fsub <4 x double> %wide.vec131, %wide.vec134
  %49 = shufflevector <4 x double> %48, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %50 = fmul <2 x double> %49, <double 5.000000e-01, double 5.000000e-01>
  %51 = fsub <2 x double> %strided.vec130, %50
  %52 = getelementptr double, double* %47, i64 -1
  %53 = bitcast double* %52 to <4 x double>*
  %interleaved.vec137 = shufflevector <2 x double> %45, <2 x double> %51, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec137, <4 x double>* %53, align 8, !alias.scope !1, !noalias !4
  %index.next121 = add i64 %index120, 2
  %54 = icmp eq i64 %index.next121, 600
  br i1 %54, label %middle.block102.loopexit145, label %vector.body101, !llvm.loop !6

scalar.ph103:                                     ; preds = %scalar.ph103.preheader, %scalar.ph103
  %indvars.iv18 = phi i64 [ %indvars.iv.next19.1, %scalar.ph103 ], [ 0, %scalar.ph103.preheader ]
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv20, i64 %indvars.iv18
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv20, i64 %indvars.iv18
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %35, i64 %indvars.iv18
  %60 = load double, double* %59, align 8
  %61 = fsub double %58, %60
  %62 = fmul double %61, 5.000000e-01
  %63 = fsub double %56, %62
  store double %63, double* %55, align 8
  %indvars.iv.next19 = or i64 %indvars.iv18, 1
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv20, i64 %indvars.iv.next19
  %65 = load double, double* %64, align 8
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv20, i64 %indvars.iv.next19
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %35, i64 %indvars.iv.next19
  %69 = load double, double* %68, align 8
  %70 = fsub double %67, %69
  %71 = fmul double %70, 5.000000e-01
  %72 = fsub double %65, %71
  store double %72, double* %64, align 8
  %indvars.iv.next19.1 = add nsw i64 %indvars.iv18, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next19.1, 1200
  br i1 %exitcond.1, label %middle.block102.loopexit, label %scalar.ph103, !llvm.loop !9

middle.block102.loopexit:                         ; preds = %scalar.ph103
  br label %middle.block102

middle.block102.loopexit145:                      ; preds = %vector.body101
  br label %middle.block102

middle.block102:                                  ; preds = %middle.block102.loopexit145, %middle.block102.loopexit
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond = icmp eq i64 %indvars.iv.next21, 1000
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond, label %vector.memcheck80.preheader, label %vector.memcheck118

vector.memcheck80.preheader:                      ; preds = %middle.block102
  br label %vector.memcheck80

vector.memcheck80:                                ; preds = %vector.memcheck80.preheader, %.loopexit143
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %.loopexit143 ], [ 0, %vector.memcheck80.preheader ]
  %scevgep68 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv25, i64 2
  %73 = add i64 %indvars.iv25, 1
  %scevgep70 = getelementptr [1200 x double], [1200 x double]* %3, i64 %73, i64 0
  %scevgep72 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv25, i64 1
  %scevgep74 = getelementptr [1200 x double], [1200 x double]* %5, i64 %73, i64 0
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv25, i64 1
  %75 = load double, double* %74, align 8
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv25, i64 1
  %77 = load double, double* %76, align 8
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv25, i64 0
  %79 = load double, double* %78, align 8
  %80 = fsub double %77, %79
  %81 = fmul double %80, 5.000000e-01
  %82 = fsub double %75, %81
  store double %82, double* %74, align 8
  %bound076 = icmp ult double* %scevgep68, %scevgep74
  %bound177 = icmp ult double* %scevgep72, %scevgep70
  %memcheck.conflict79 = and i1 %bound076, %bound177
  br i1 %memcheck.conflict79, label %scalar.ph65.preheader, label %vector.body63.preheader

vector.body63.preheader:                          ; preds = %vector.memcheck80
  br label %vector.body63

scalar.ph65.preheader.loopexit:                   ; preds = %vector.body63
  br label %scalar.ph65.preheader

scalar.ph65.preheader:                            ; preds = %scalar.ph65.preheader.loopexit, %vector.memcheck80
  %indvars.iv.next2338.ph = phi i64 [ 2, %vector.memcheck80 ], [ 1198, %scalar.ph65.preheader.loopexit ]
  %indvars.iv2237.ph = phi i64 [ 1, %vector.memcheck80 ], [ 1197, %scalar.ph65.preheader.loopexit ]
  br label %scalar.ph65

vector.body63:                                    ; preds = %vector.body63.preheader, %vector.body63
  %index82 = phi i64 [ %index.next83, %vector.body63 ], [ 0, %vector.body63.preheader ]
  %83 = shl i64 %index82, 1
  %offset.idx = or i64 %83, 2
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv25, i64 %offset.idx
  %85 = bitcast double* %84 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %85, align 8, !alias.scope !10, !noalias !13
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec94 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv25, i64 %offset.idx
  %87 = getelementptr double, double* %86, i64 -1
  %88 = bitcast double* %87 to <4 x double>*
  %wide.vec95 = load <4 x double>, <4 x double>* %88, align 8, !alias.scope !13
  %strided.vec96 = shufflevector <4 x double> %wide.vec95, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec97 = shufflevector <4 x double> %wide.vec95, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %89 = fsub <2 x double> %strided.vec97, %strided.vec96
  %90 = fmul <2 x double> %89, <double 5.000000e-01, double 5.000000e-01>
  %91 = fsub <2 x double> %strided.vec, %90
  %92 = or i64 %83, 3
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv25, i64 %92
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv25, i64 %92
  %95 = getelementptr double, double* %94, i64 -1
  %96 = bitcast double* %95 to <4 x double>*
  %wide.vec98 = load <4 x double>, <4 x double>* %96, align 8, !alias.scope !13
  %strided.vec99 = shufflevector <4 x double> %wide.vec98, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec100 = shufflevector <4 x double> %wide.vec98, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %97 = fsub <2 x double> %strided.vec100, %strided.vec99
  %98 = fmul <2 x double> %97, <double 5.000000e-01, double 5.000000e-01>
  %99 = fsub <2 x double> %strided.vec94, %98
  %100 = getelementptr double, double* %93, i64 -1
  %101 = bitcast double* %100 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %91, <2 x double> %99, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %101, align 8, !alias.scope !10, !noalias !13
  %index.next83 = add i64 %index82, 2
  %102 = icmp eq i64 %index.next83, 598
  br i1 %102, label %scalar.ph65.preheader.loopexit, label %vector.body63, !llvm.loop !15

.loopexit143:                                     ; preds = %scalar.ph65
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next26, 1000
  br i1 %exitcond27, label %vector.memcheck.preheader, label %vector.memcheck80

vector.memcheck.preheader:                        ; preds = %.loopexit143
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %vector.memcheck.preheader, %.loopexit
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %.loopexit ], [ 0, %vector.memcheck.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv31, i64 0
  %scevgep40 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv31, i64 1199
  %scevgep42 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv31, i64 0
  %103 = add i64 %indvars.iv31, 1
  %scevgep44 = getelementptr [1200 x double], [1200 x double]* %3, i64 %103, i64 0
  %scevgep46 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 0
  %scevgep48 = getelementptr [1200 x double], [1200 x double]* %4, i64 %103, i64 1199
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %bound0 = icmp ult double* %scevgep, %scevgep44
  %bound1 = icmp ult double* %scevgep42, %scevgep40
  %found.conflict = and i1 %bound0, %bound1
  %bound050 = icmp ult double* %scevgep, %scevgep48
  %bound151 = icmp ult double* %scevgep46, %scevgep40
  %found.conflict52 = and i1 %bound050, %bound151
  %conflict.rdx = or i1 %found.conflict, %found.conflict52
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv31, i64 %index
  %105 = bitcast double* %104 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %105, align 8, !alias.scope !16, !noalias !19
  %106 = getelementptr double, double* %104, i64 2
  %107 = bitcast double* %106 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %107, align 8, !alias.scope !16, !noalias !19
  %108 = or i64 %index, 1
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv31, i64 %108
  %110 = bitcast double* %109 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %110, align 8, !alias.scope !22
  %111 = getelementptr double, double* %109, i64 2
  %112 = bitcast double* %111 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %112, align 8, !alias.scope !22
  %113 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv31, i64 %index
  %114 = bitcast double* %113 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %114, align 8, !alias.scope !22
  %115 = getelementptr double, double* %113, i64 2
  %116 = bitcast double* %115 to <2 x double>*
  %wide.load58 = load <2 x double>, <2 x double>* %116, align 8, !alias.scope !22
  %117 = fsub <2 x double> %wide.load55, %wide.load57
  %118 = fsub <2 x double> %wide.load56, %wide.load58
  %119 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next32, i64 %index
  %120 = bitcast double* %119 to <2 x double>*
  %wide.load59 = load <2 x double>, <2 x double>* %120, align 8, !alias.scope !23
  %121 = getelementptr double, double* %119, i64 2
  %122 = bitcast double* %121 to <2 x double>*
  %wide.load60 = load <2 x double>, <2 x double>* %122, align 8, !alias.scope !23
  %123 = fadd <2 x double> %117, %wide.load59
  %124 = fadd <2 x double> %118, %wide.load60
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %index
  %126 = bitcast double* %125 to <2 x double>*
  %wide.load61 = load <2 x double>, <2 x double>* %126, align 8, !alias.scope !23
  %127 = getelementptr double, double* %125, i64 2
  %128 = bitcast double* %127 to <2 x double>*
  %wide.load62 = load <2 x double>, <2 x double>* %128, align 8, !alias.scope !23
  %129 = fsub <2 x double> %123, %wide.load61
  %130 = fsub <2 x double> %124, %wide.load62
  %131 = fmul <2 x double> %129, <double 7.000000e-01, double 7.000000e-01>
  %132 = fmul <2 x double> %130, <double 7.000000e-01, double 7.000000e-01>
  %133 = fsub <2 x double> %wide.load, %131
  %134 = fsub <2 x double> %wide.load54, %132
  %135 = bitcast double* %104 to <2 x double>*
  store <2 x double> %133, <2 x double>* %135, align 8, !alias.scope !16, !noalias !19
  %136 = bitcast double* %106 to <2 x double>*
  store <2 x double> %134, <2 x double>* %136, align 8, !alias.scope !16, !noalias !19
  %index.next = add i64 %index, 4
  %137 = icmp eq i64 %index.next, 1196
  br i1 %137, label %scalar.ph.preheader.loopexit, label %vector.body, !llvm.loop !24

scalar.ph.preheader.loopexit:                     ; preds = %vector.body
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %scalar.ph.preheader.loopexit, %vector.memcheck
  %indvars.iv28.ph = phi i64 [ 0, %vector.memcheck ], [ 1196, %scalar.ph.preheader.loopexit ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %scalar.ph ], [ %indvars.iv28.ph, %scalar.ph.preheader ]
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv31, i64 %indvars.iv28
  %139 = load double, double* %138, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %140 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv31, i64 %indvars.iv.next29
  %141 = load double, double* %140, align 8
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv31, i64 %indvars.iv28
  %143 = load double, double* %142, align 8
  %144 = fsub double %141, %143
  %145 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next32, i64 %indvars.iv28
  %146 = load double, double* %145, align 8
  %147 = fadd double %144, %146
  %148 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv28
  %149 = load double, double* %148, align 8
  %150 = fsub double %147, %149
  %151 = fmul double %150, 7.000000e-01
  %152 = fsub double %139, %151
  store double %152, double* %138, align 8
  %exitcond30 = icmp eq i64 %indvars.iv.next29, 1199
  br i1 %exitcond30, label %.loopexit, label %scalar.ph, !llvm.loop !25

.loopexit:                                        ; preds = %scalar.ph
  %exitcond33 = icmp eq i64 %indvars.iv.next32, 999
  br i1 %exitcond33, label %153, label %vector.memcheck

; <label>:153:                                    ; preds = %.loopexit
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next35, 500
  br i1 %exitcond36, label %154, label %.preheader13

; <label>:154:                                    ; preds = %153
  ret void

scalar.ph65:                                      ; preds = %scalar.ph65.preheader, %scalar.ph65
  %indvars.iv.next2338 = phi i64 [ %indvars.iv.next23, %scalar.ph65 ], [ %indvars.iv.next2338.ph, %scalar.ph65.preheader ]
  %indvars.iv2237 = phi i64 [ %indvars.iv.next23.1, %scalar.ph65 ], [ %indvars.iv2237.ph, %scalar.ph65.preheader ]
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv25, i64 %indvars.iv.next2338
  %156 = load double, double* %155, align 8
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv.next2338
  %158 = load double, double* %157, align 8
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv2237
  %160 = load double, double* %159, align 8
  %161 = fsub double %158, %160
  %162 = fmul double %161, 5.000000e-01
  %163 = fsub double %156, %162
  store double %163, double* %155, align 8
  %indvars.iv.next23.1 = add nsw i64 %indvars.iv2237, 2
  %164 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv25, i64 %indvars.iv.next23.1
  %165 = load double, double* %164, align 8
  %166 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv.next23.1
  %167 = load double, double* %166, align 8
  %168 = add nsw i64 %indvars.iv2237, 1
  %169 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv25, i64 %168
  %170 = load double, double* %169, align 8
  %171 = fsub double %167, %170
  %172 = fmul double %171, 5.000000e-01
  %173 = fsub double %165, %172
  store double %173, double* %164, align 8
  %indvars.iv.next23 = add nsw i64 %indvars.iv2237, 3
  %exitcond24 = icmp eq i64 %indvars.iv.next23, 1200
  br i1 %exitcond24, label %.loopexit143, label %scalar.ph65, !llvm.loop !26
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*) unnamed_addr #0 {
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %6) #4
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader15

.preheader15:                                     ; preds = %22, %5
  %indvars.iv31 = phi i64 [ 0, %5 ], [ %indvars.iv.next32, %22 ]
  %10 = mul nuw nsw i64 %indvars.iv31, 1000
  br label %11

; <label>:11:                                     ; preds = %._crit_edge, %.preheader15
  %indvars.iv28 = phi i64 [ 0, %.preheader15 ], [ %indvars.iv.next29, %._crit_edge ]
  %12 = add nuw nsw i64 %indvars.iv28, %10
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc11 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %11, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv31, i64 %indvars.iv28
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next29, 1200
  br i1 %exitcond30, label %22, label %11

; <label>:22:                                     ; preds = %._crit_edge
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next32, 1000
  br i1 %exitcond33, label %23, label %.preheader15

; <label>:23:                                     ; preds = %22
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #4
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %.preheader14

.preheader14:                                     ; preds = %42, %23
  %indvars.iv25 = phi i64 [ 0, %23 ], [ %indvars.iv.next26, %42 ]
  %30 = mul nuw nsw i64 %indvars.iv25, 1000
  br label %31

; <label>:31:                                     ; preds = %._crit_edge12, %.preheader14
  %indvars.iv22 = phi i64 [ 0, %.preheader14 ], [ %indvars.iv.next23, %._crit_edge12 ]
  %32 = add nuw nsw i64 %indvars.iv22, %30
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, 20
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %._crit_edge12

; <label>:36:                                     ; preds = %31
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc8 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %37) #4
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %31, %36
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv25, i64 %indvars.iv22
  %40 = load double, double* %39, align 8
  %41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %38, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %40) #5
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next23, 1200
  br i1 %exitcond24, label %42, label %31

; <label>:42:                                     ; preds = %._crit_edge12
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next26, 1000
  br i1 %exitcond27, label %43, label %.preheader14

; <label>:43:                                     ; preds = %42
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br label %.preheader

.preheader:                                       ; preds = %60, %43
  %indvars.iv19 = phi i64 [ 0, %43 ], [ %indvars.iv.next20, %60 ]
  %48 = mul nuw nsw i64 %indvars.iv19, 1000
  br label %49

; <label>:49:                                     ; preds = %._crit_edge13, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge13 ]
  %50 = add nuw nsw i64 %indvars.iv, %48
  %51 = trunc i64 %50 to i32
  %52 = srem i32 %51, 20
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %54, label %._crit_edge13

; <label>:54:                                     ; preds = %49
  %55 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %55) #4
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %49, %54
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv19, i64 %indvars.iv
  %58 = load double, double* %57, align 8
  %59 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %56, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %58) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %60, label %49

; <label>:60:                                     ; preds = %._crit_edge13
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 1000
  br i1 %exitcond21, label %61, label %.preheader

; <label>:61:                                     ; preds = %60
  %62 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %63 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %62, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
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
