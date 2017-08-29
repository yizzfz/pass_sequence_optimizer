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
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #4
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call void @init_array(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_fdtd_2d(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
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
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #2 {
..lr.ph29_crit_edge:
  br label %.lr.ph29

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %7 = trunc i64 %indvars.iv30 to i32
  %8 = sitofp i32 %7 to double
  %9 = insertelement <2 x double> undef, double %8, i32 0
  %10 = shufflevector <2 x double> %9, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %11 = trunc i64 %indvars.iv.next to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv30, i64 %indvars.iv
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
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv30, i64 %indvars.iv
  store double %22, double* %23, align 8
  %24 = add nuw nsw i64 %indvars.iv, 3
  %25 = trunc i64 %24 to i32
  %26 = sitofp i32 %25 to double
  %27 = fmul double %8, %26
  %28 = fdiv double %27, 1.000000e+03
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv30, i64 %indvars.iv
  store double %28, double* %29, align 8
  %exitcond37 = icmp eq i64 %indvars.iv, 1199
  br i1 %exitcond37, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond = icmp ne i64 %indvars.iv.next31, 1000
  br i1 %exitcond, label %.preheader.us, label %._crit_edge26

.lr.ph29:                                         ; preds = %.lr.ph29, %..lr.ph29_crit_edge
  %indvars.iv33 = phi i64 [ 0, %..lr.ph29_crit_edge ], [ %indvars.iv.next34.4, %.lr.ph29 ]
  %30 = trunc i64 %indvars.iv33 to i32
  %31 = sitofp i32 %30 to double
  %32 = getelementptr inbounds double, double* %6, i64 %indvars.iv33
  store double %31, double* %32, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %33 = trunc i64 %indvars.iv.next34 to i32
  %34 = sitofp i32 %33 to double
  %35 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next34
  store double %34, double* %35, align 8
  %indvars.iv.next34.1 = add nuw nsw i64 %indvars.iv33, 2
  %36 = trunc i64 %indvars.iv.next34.1 to i32
  %37 = sitofp i32 %36 to double
  %38 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next34.1
  store double %37, double* %38, align 8
  %indvars.iv.next34.2 = add nuw nsw i64 %indvars.iv33, 3
  %39 = trunc i64 %indvars.iv.next34.2 to i32
  %40 = sitofp i32 %39 to double
  %41 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next34.2
  store double %40, double* %41, align 8
  %indvars.iv.next34.3 = add nuw nsw i64 %indvars.iv33, 4
  %42 = trunc i64 %indvars.iv.next34.3 to i32
  %43 = sitofp i32 %42 to double
  %44 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next34.3
  store double %43, double* %44, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next34.3, 499
  %indvars.iv.next34.4 = add nuw nsw i64 %indvars.iv33, 5
  br i1 %exitcond.4, label %.preheader.us.preheader, label %.lr.ph29

.preheader.us.preheader:                          ; preds = %.lr.ph29
  br label %.preheader.us

._crit_edge26:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_fdtd_2d(i32, i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #2 {
.preheader73.lr.ph:
  %sunkaddr = ptrtoint double* %6 to i64
  %sunkaddr.1 = ptrtoint double* %6 to i64
  %sunkaddr.2 = ptrtoint double* %6 to i64
  %sunkaddr.3 = ptrtoint double* %6 to i64
  %sunkaddr.4 = ptrtoint double* %6 to i64
  br label %.preheader73

.preheader73:                                     ; preds = %._crit_edge86, %.preheader73.lr.ph
  %indvars.iv113 = phi i64 [ 0, %.preheader73.lr.ph ], [ %indvars.iv.next114, %._crit_edge86 ]
  %sunkaddr118 = shl i64 %indvars.iv113, 3
  %sunkaddr119 = add i64 %sunkaddr, %sunkaddr118
  %sunkaddr120 = inttoptr i64 %sunkaddr119 to i64*
  %sunkaddr118.1 = shl i64 %indvars.iv113, 3
  %sunkaddr119.1 = add i64 %sunkaddr.1, %sunkaddr118.1
  %sunkaddr120.1 = inttoptr i64 %sunkaddr119.1 to i64*
  %sunkaddr118.2 = shl i64 %indvars.iv113, 3
  %sunkaddr119.2 = add i64 %sunkaddr.2, %sunkaddr118.2
  %sunkaddr120.2 = inttoptr i64 %sunkaddr119.2 to i64*
  %sunkaddr118.3 = shl i64 %indvars.iv113, 3
  %sunkaddr119.3 = add i64 %sunkaddr.3, %sunkaddr118.3
  %sunkaddr120.3 = inttoptr i64 %sunkaddr119.3 to i64*
  %sunkaddr118.4 = shl i64 %indvars.iv113, 3
  %sunkaddr119.4 = add i64 %sunkaddr.4, %sunkaddr118.4
  %sunkaddr120.4 = inttoptr i64 %sunkaddr119.4 to i64*
  br label %.lr.ph

.preheader69.us:                                  ; preds = %.preheader69.us.preheader, %._crit_edge.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge.us ], [ 0, %.preheader69.us.preheader ]
  %indvars.iv97 = phi i64 [ %indvars.iv.next98, %._crit_edge.us ], [ 1, %.preheader69.us.preheader ]
  %7 = add nuw nsw i64 %indvar, 1
  %scevgep185 = getelementptr [1200 x double], [1200 x double]* %4, i64 %7, i64 0
  %8 = add nuw nsw i64 %indvar, 2
  %scevgep187 = getelementptr [1200 x double], [1200 x double]* %4, i64 %8, i64 0
  %scevgep189 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvar, i64 0
  %scevgep191 = getelementptr [1200 x double], [1200 x double]* %5, i64 %8, i64 0
  %9 = add nsw i64 %indvars.iv97, -1
  %bound0193 = icmp ult double* %scevgep185, %scevgep191
  %bound1194 = icmp ult double* %scevgep189, %scevgep187
  %memcheck.conflict196 = and i1 %bound0193, %bound1194
  br i1 %memcheck.conflict196, label %scalar.ph182.preheader, label %vector.body180.preheader

vector.body180.preheader:                         ; preds = %.preheader69.us
  br label %vector.body180

scalar.ph182.preheader:                           ; preds = %.preheader69.us
  br label %scalar.ph182

vector.body180:                                   ; preds = %vector.body180.preheader, %vector.body180
  %index199 = phi i64 [ %index.next200, %vector.body180 ], [ 0, %vector.body180.preheader ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv97, i64 %index199
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load207 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1, !noalias !4
  %12 = getelementptr double, double* %10, i64 2
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load208 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1, !noalias !4
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv97, i64 %index199
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load209 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !4
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load210 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !4
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %9, i64 %index199
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load211 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !4
  %20 = getelementptr double, double* %18, i64 2
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load212 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !4
  %22 = fsub <2 x double> %wide.load209, %wide.load211
  %23 = fsub <2 x double> %wide.load210, %wide.load212
  %24 = fmul <2 x double> %22, <double 5.000000e-01, double 5.000000e-01>
  %25 = fmul <2 x double> %23, <double 5.000000e-01, double 5.000000e-01>
  %26 = fsub <2 x double> %wide.load207, %24
  %27 = fsub <2 x double> %wide.load208, %25
  %28 = bitcast double* %10 to <2 x double>*
  store <2 x double> %26, <2 x double>* %28, align 8, !alias.scope !1, !noalias !4
  %29 = bitcast double* %12 to <2 x double>*
  store <2 x double> %27, <2 x double>* %29, align 8, !alias.scope !1, !noalias !4
  %index.next200 = add nuw nsw i64 %index199, 4
  %30 = icmp eq i64 %index.next200, 1200
  br i1 %30, label %._crit_edge.us.loopexit213, label %vector.body180, !llvm.loop !6

scalar.ph182:                                     ; preds = %scalar.ph182, %scalar.ph182.preheader
  %indvars.iv93 = phi i64 [ 0, %scalar.ph182.preheader ], [ %indvars.iv.next94.1, %scalar.ph182 ]
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv97, i64 %indvars.iv93
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv97, i64 %indvars.iv93
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %9, i64 %indvars.iv93
  %36 = load double, double* %35, align 8
  %37 = fsub double %34, %36
  %38 = fmul double %37, 5.000000e-01
  %39 = fsub double %32, %38
  store double %39, double* %31, align 8
  %indvars.iv.next94 = or i64 %indvars.iv93, 1
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv97, i64 %indvars.iv.next94
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv97, i64 %indvars.iv.next94
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %9, i64 %indvars.iv.next94
  %45 = load double, double* %44, align 8
  %46 = fsub double %43, %45
  %47 = fmul double %46, 5.000000e-01
  %48 = fsub double %41, %47
  store double %48, double* %40, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next94, 1199
  %indvars.iv.next94.1 = add nuw nsw i64 %indvars.iv93, 2
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %scalar.ph182, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph182
  br label %._crit_edge.us

._crit_edge.us.loopexit213:                       ; preds = %vector.body180
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit213, %._crit_edge.us.loopexit
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond = icmp ne i64 %indvar.next, 999
  br i1 %exitcond, label %.preheader69.us, label %.preheader68.us.preheader

.preheader68.us.preheader:                        ; preds = %._crit_edge.us
  br label %.preheader68.us

.lr.ph:                                           ; preds = %.lr.ph, %.preheader73
  %indvars.iv = phi i64 [ 0, %.preheader73 ], [ %indvars.iv.next.4, %.lr.ph ]
  %49 = load i64, i64* %sunkaddr120, align 8
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv
  %51 = bitcast double* %50 to i64*
  store i64 %49, i64* %51, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %52 = load i64, i64* %sunkaddr120.1, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next
  %54 = bitcast double* %53 to i64*
  store i64 %52, i64* %54, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %55 = load i64, i64* %sunkaddr120.2, align 8
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.1
  %57 = bitcast double* %56 to i64*
  store i64 %55, i64* %57, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %58 = load i64, i64* %sunkaddr120.3, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.2
  %60 = bitcast double* %59 to i64*
  store i64 %58, i64* %60, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %61 = load i64, i64* %sunkaddr120.4, align 8
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.3
  %63 = bitcast double* %62 to i64*
  store i64 %61, i64* %63, align 8
  %exitcond115.4 = icmp eq i64 %indvars.iv.next.3, 1199
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  br i1 %exitcond115.4, label %.preheader69.us.preheader, label %.lr.ph

.preheader69.us.preheader:                        ; preds = %.lr.ph
  br label %.preheader69.us

.preheader68.us:                                  ; preds = %.preheader68.us.preheader, %._crit_edge80.us
  %indvars.iv104 = phi i64 [ %indvars.iv.next105, %._crit_edge80.us ], [ 0, %.preheader68.us.preheader ]
  %scevgep152 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv104, i64 1
  %64 = add nuw nsw i64 %indvars.iv104, 1
  %scevgep154 = getelementptr [1200 x double], [1200 x double]* %3, i64 %64, i64 0
  %scevgep156 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv104, i64 0
  %scevgep158 = getelementptr [1200 x double], [1200 x double]* %5, i64 %64, i64 0
  %bound0160 = icmp ult double* %scevgep152, %scevgep158
  %bound1161 = icmp ult double* %scevgep156, %scevgep154
  %memcheck.conflict163 = and i1 %bound0160, %bound1161
  br i1 %memcheck.conflict163, label %scalar.ph149.preheader, label %vector.body147.preheader

vector.body147.preheader:                         ; preds = %.preheader68.us
  br label %vector.body147

vector.body147:                                   ; preds = %vector.body147.preheader, %vector.body147
  %index166 = phi i64 [ %index.next167, %vector.body147 ], [ 0, %vector.body147.preheader ]
  %offset.idx = or i64 %index166, 1
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv104, i64 %offset.idx
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load174 = load <2 x double>, <2 x double>* %66, align 8, !alias.scope !10, !noalias !13
  %67 = getelementptr double, double* %65, i64 2
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load175 = load <2 x double>, <2 x double>* %68, align 8, !alias.scope !10, !noalias !13
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv104, i64 %offset.idx
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load176 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !13
  %71 = getelementptr double, double* %69, i64 2
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load177 = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !13
  %73 = add nsw i64 %offset.idx, -1
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv104, i64 %73
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load178 = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !13
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load179 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !13
  %78 = fsub <2 x double> %wide.load176, %wide.load178
  %79 = fsub <2 x double> %wide.load177, %wide.load179
  %80 = fmul <2 x double> %78, <double 5.000000e-01, double 5.000000e-01>
  %81 = fmul <2 x double> %79, <double 5.000000e-01, double 5.000000e-01>
  %82 = fsub <2 x double> %wide.load174, %80
  %83 = fsub <2 x double> %wide.load175, %81
  %84 = bitcast double* %65 to <2 x double>*
  store <2 x double> %82, <2 x double>* %84, align 8, !alias.scope !10, !noalias !13
  %85 = bitcast double* %67 to <2 x double>*
  store <2 x double> %83, <2 x double>* %85, align 8, !alias.scope !10, !noalias !13
  %index.next167 = add nuw nsw i64 %index166, 4
  %86 = icmp eq i64 %index.next167, 1196
  br i1 %86, label %scalar.ph149.preheader.loopexit, label %vector.body147, !llvm.loop !15

scalar.ph149.preheader.loopexit:                  ; preds = %vector.body147
  br label %scalar.ph149.preheader

scalar.ph149.preheader:                           ; preds = %scalar.ph149.preheader.loopexit, %.preheader68.us
  %indvars.iv100.ph = phi i64 [ 1, %.preheader68.us ], [ 1197, %scalar.ph149.preheader.loopexit ]
  br i1 true, label %scalar.ph149.prol.preheader, label %scalar.ph149.prol.loopexit.unr-lcssa

scalar.ph149.prol.preheader:                      ; preds = %scalar.ph149.preheader
  br label %scalar.ph149.prol

scalar.ph149.prol:                                ; preds = %scalar.ph149.prol.preheader
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv104, i64 %indvars.iv100.ph
  %88 = load double, double* %87, align 8
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv104, i64 %indvars.iv100.ph
  %90 = load double, double* %89, align 8
  %91 = add nsw i64 %indvars.iv100.ph, -1
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv104, i64 %91
  %93 = load double, double* %92, align 8
  %94 = fsub double %90, %93
  %95 = fmul double %94, 5.000000e-01
  %96 = fsub double %88, %95
  store double %96, double* %87, align 8
  %indvars.iv.next101.prol = add nuw nsw i64 %indvars.iv100.ph, 1
  br label %scalar.ph149.prol.loopexit.unr-lcssa

scalar.ph149.prol.loopexit.unr-lcssa:             ; preds = %scalar.ph149.preheader, %scalar.ph149.prol
  %indvars.iv100.unr.ph = phi i64 [ %indvars.iv.next101.prol, %scalar.ph149.prol ], [ %indvars.iv100.ph, %scalar.ph149.preheader ]
  br label %scalar.ph149.prol.loopexit

scalar.ph149.prol.loopexit:                       ; preds = %scalar.ph149.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge80.us, label %scalar.ph149.preheader.new

scalar.ph149.preheader.new:                       ; preds = %scalar.ph149.prol.loopexit
  br label %scalar.ph149

scalar.ph149:                                     ; preds = %scalar.ph149, %scalar.ph149.preheader.new
  %indvars.iv100 = phi i64 [ %indvars.iv100.unr.ph, %scalar.ph149.preheader.new ], [ %indvars.iv.next101.1, %scalar.ph149 ]
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv104, i64 %indvars.iv100
  %98 = load double, double* %97, align 8
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv104, i64 %indvars.iv100
  %100 = load double, double* %99, align 8
  %101 = add nsw i64 %indvars.iv100, -1
  %102 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv104, i64 %101
  %103 = load double, double* %102, align 8
  %104 = fsub double %100, %103
  %105 = fmul double %104, 5.000000e-01
  %106 = fsub double %98, %105
  store double %106, double* %97, align 8
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %107 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv104, i64 %indvars.iv.next101
  %108 = load double, double* %107, align 8
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv104, i64 %indvars.iv.next101
  %110 = load double, double* %109, align 8
  %111 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv104, i64 %indvars.iv100
  %112 = load double, double* %111, align 8
  %113 = fsub double %110, %112
  %114 = fmul double %113, 5.000000e-01
  %115 = fsub double %108, %114
  store double %115, double* %107, align 8
  %exitcond116.1 = icmp eq i64 %indvars.iv.next101, 1199
  %indvars.iv.next101.1 = add nsw i64 %indvars.iv100, 2
  br i1 %exitcond116.1, label %._crit_edge80.us.unr-lcssa, label %scalar.ph149, !llvm.loop !16

._crit_edge80.us.unr-lcssa:                       ; preds = %scalar.ph149
  br label %._crit_edge80.us

._crit_edge80.us:                                 ; preds = %scalar.ph149.prol.loopexit, %._crit_edge80.us.unr-lcssa
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %exitcond214 = icmp ne i64 %indvars.iv.next105, 1000
  br i1 %exitcond214, label %.preheader68.us, label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge80.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge84.us
  %indvars.iv111 = phi i64 [ %indvars.iv.next112, %._crit_edge84.us ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv111, i64 0
  %scevgep124 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv111, i64 1199
  %scevgep126 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv111, i64 0
  %116 = add nuw nsw i64 %indvars.iv111, 1
  %scevgep128 = getelementptr [1200 x double], [1200 x double]* %3, i64 %116, i64 0
  %scevgep130 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv111, i64 0
  %scevgep132 = getelementptr [1200 x double], [1200 x double]* %4, i64 %116, i64 1199
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  %bound0 = icmp ult double* %scevgep, %scevgep128
  %bound1 = icmp ult double* %scevgep126, %scevgep124
  %found.conflict = and i1 %bound0, %bound1
  %bound0134 = icmp ult double* %scevgep, %scevgep132
  %bound1135 = icmp ult double* %scevgep130, %scevgep124
  %found.conflict136 = and i1 %bound0134, %bound1135
  %conflict.rdx = or i1 %found.conflict, %found.conflict136
  br i1 %conflict.rdx, label %._crit_edge91.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %117 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv111, i64 %index
  %118 = bitcast double* %117 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %118, align 8, !alias.scope !17, !noalias !20
  %119 = getelementptr double, double* %117, i64 2
  %120 = bitcast double* %119 to <2 x double>*
  %wide.load138 = load <2 x double>, <2 x double>* %120, align 8, !alias.scope !17, !noalias !20
  %121 = or i64 %index, 1
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv111, i64 %121
  %123 = bitcast double* %122 to <2 x double>*
  %wide.load139 = load <2 x double>, <2 x double>* %123, align 8, !alias.scope !23
  %124 = getelementptr double, double* %122, i64 2
  %125 = bitcast double* %124 to <2 x double>*
  %wide.load140 = load <2 x double>, <2 x double>* %125, align 8, !alias.scope !23
  %126 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv111, i64 %index
  %127 = bitcast double* %126 to <2 x double>*
  %wide.load141 = load <2 x double>, <2 x double>* %127, align 8, !alias.scope !23
  %128 = getelementptr double, double* %126, i64 2
  %129 = bitcast double* %128 to <2 x double>*
  %wide.load142 = load <2 x double>, <2 x double>* %129, align 8, !alias.scope !23
  %130 = fsub <2 x double> %wide.load139, %wide.load141
  %131 = fsub <2 x double> %wide.load140, %wide.load142
  %132 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next112, i64 %index
  %133 = bitcast double* %132 to <2 x double>*
  %wide.load143 = load <2 x double>, <2 x double>* %133, align 8, !alias.scope !24
  %134 = getelementptr double, double* %132, i64 2
  %135 = bitcast double* %134 to <2 x double>*
  %wide.load144 = load <2 x double>, <2 x double>* %135, align 8, !alias.scope !24
  %136 = fadd <2 x double> %130, %wide.load143
  %137 = fadd <2 x double> %131, %wide.load144
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv111, i64 %index
  %139 = bitcast double* %138 to <2 x double>*
  %wide.load145 = load <2 x double>, <2 x double>* %139, align 8, !alias.scope !24
  %140 = getelementptr double, double* %138, i64 2
  %141 = bitcast double* %140 to <2 x double>*
  %wide.load146 = load <2 x double>, <2 x double>* %141, align 8, !alias.scope !24
  %142 = fsub <2 x double> %136, %wide.load145
  %143 = fsub <2 x double> %137, %wide.load146
  %144 = fmul <2 x double> %142, <double 7.000000e-01, double 7.000000e-01>
  %145 = fmul <2 x double> %143, <double 7.000000e-01, double 7.000000e-01>
  %146 = fsub <2 x double> %wide.load, %144
  %147 = fsub <2 x double> %wide.load138, %145
  %148 = bitcast double* %117 to <2 x double>*
  store <2 x double> %146, <2 x double>* %148, align 8, !alias.scope !17, !noalias !20
  %149 = bitcast double* %119 to <2 x double>*
  store <2 x double> %147, <2 x double>* %149, align 8, !alias.scope !17, !noalias !20
  %index.next = add nuw nsw i64 %index, 4
  %150 = icmp eq i64 %index.next, 1196
  br i1 %150, label %._crit_edge91.preheader.loopexit, label %vector.body, !llvm.loop !25

._crit_edge91.preheader.loopexit:                 ; preds = %vector.body
  br label %._crit_edge91.preheader

._crit_edge91.preheader:                          ; preds = %._crit_edge91.preheader.loopexit, %.preheader.us
  %indvars.iv107.ph = phi i64 [ 0, %.preheader.us ], [ 1196, %._crit_edge91.preheader.loopexit ]
  br label %._crit_edge91

._crit_edge91:                                    ; preds = %._crit_edge91.preheader, %._crit_edge91
  %indvars.iv107 = phi i64 [ %indvars.iv.next108, %._crit_edge91 ], [ %indvars.iv107.ph, %._crit_edge91.preheader ]
  %151 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv111, i64 %indvars.iv107
  %152 = load double, double* %151, align 8
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %153 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv111, i64 %indvars.iv.next108
  %154 = load double, double* %153, align 8
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv111, i64 %indvars.iv107
  %156 = load double, double* %155, align 8
  %157 = fsub double %154, %156
  %158 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next112, i64 %indvars.iv107
  %159 = load double, double* %158, align 8
  %160 = fadd double %157, %159
  %161 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv111, i64 %indvars.iv107
  %162 = load double, double* %161, align 8
  %163 = fsub double %160, %162
  %164 = fmul double %163, 7.000000e-01
  %165 = fsub double %152, %164
  store double %165, double* %151, align 8
  %exitcond117 = icmp eq i64 %indvars.iv107, 1198
  br i1 %exitcond117, label %._crit_edge84.us, label %._crit_edge91, !llvm.loop !26

._crit_edge84.us:                                 ; preds = %._crit_edge91
  %exitcond215 = icmp ne i64 %indvars.iv.next112, 999
  br i1 %exitcond215, label %.preheader.us, label %._crit_edge86

._crit_edge86:                                    ; preds = %._crit_edge84.us
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %exitcond216 = icmp ne i64 %indvars.iv.next114, 500
  br i1 %exitcond216, label %.preheader73, label %._crit_edge88

._crit_edge88:                                    ; preds = %._crit_edge86
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*) #0 {
.preheader41.lr.ph..preheader41.us_crit_edge:
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #5
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader41.us

.preheader41.us:                                  ; preds = %._crit_edge55.us, %.preheader41.lr.ph..preheader41.us_crit_edge
  %indvars.iv66 = phi i64 [ 0, %.preheader41.lr.ph..preheader41.us_crit_edge ], [ %indvars.iv.next67, %._crit_edge55.us ]
  %9 = mul nuw nsw i64 %indvars.iv66, 1000
  br label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us, %.preheader41.us
  %indvars.iv64 = phi i64 [ 0, %.preheader41.us ], [ %indvars.iv.next65, %._crit_edge.us ]
  %10 = add nuw nsw i64 %indvars.iv64, %9
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge.us

; <label>:14:                                     ; preds = %._crit_edge.us._crit_edge
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc11.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us._crit_edge, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv66, i64 %indvars.iv64
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond73 = icmp ne i64 %indvars.iv.next65, 1200
  br i1 %exitcond73, label %._crit_edge.us._crit_edge, label %._crit_edge55.us

._crit_edge55.us:                                 ; preds = %._crit_edge.us
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond74 = icmp ne i64 %indvars.iv.next67, 1000
  br i1 %exitcond74, label %.preheader41.us, label %._crit_edge57

._crit_edge57:                                    ; preds = %._crit_edge55.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %.preheader40.us

.preheader40.us:                                  ; preds = %._crit_edge50.us, %._crit_edge57
  %indvars.iv62 = phi i64 [ 0, %._crit_edge57 ], [ %indvars.iv.next63, %._crit_edge50.us ]
  %26 = mul nuw nsw i64 %indvars.iv62, 1000
  br label %._crit_edge42.us._crit_edge

._crit_edge42.us._crit_edge:                      ; preds = %._crit_edge42.us, %.preheader40.us
  %indvars.iv60 = phi i64 [ 0, %.preheader40.us ], [ %indvars.iv.next61, %._crit_edge42.us ]
  %27 = add nuw nsw i64 %indvars.iv60, %26
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 20
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %31, label %._crit_edge42.us

; <label>:31:                                     ; preds = %._crit_edge42.us._crit_edge
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc8.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %32) #5
  br label %._crit_edge42.us

._crit_edge42.us:                                 ; preds = %._crit_edge42.us._crit_edge, %31
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv62, i64 %indvars.iv60
  %35 = load double, double* %34, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %35) #6
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond71 = icmp ne i64 %indvars.iv.next61, 1200
  br i1 %exitcond71, label %._crit_edge42.us._crit_edge, label %._crit_edge50.us

._crit_edge50.us:                                 ; preds = %._crit_edge42.us
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond72 = icmp ne i64 %indvars.iv.next63, 1000
  br i1 %exitcond72, label %.preheader40.us, label %._crit_edge52

._crit_edge52:                                    ; preds = %._crit_edge50.us
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge45.us, %._crit_edge52
  %indvars.iv58 = phi i64 [ 0, %._crit_edge52 ], [ %indvars.iv.next59, %._crit_edge45.us ]
  %41 = mul nuw nsw i64 %indvars.iv58, 1000
  br label %._crit_edge43.us._crit_edge

._crit_edge43.us._crit_edge:                      ; preds = %._crit_edge43.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge43.us ]
  %42 = add nuw nsw i64 %indvars.iv, %41
  %43 = trunc i64 %42 to i32
  %44 = srem i32 %43, 20
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %46, label %._crit_edge43.us

; <label>:46:                                     ; preds = %._crit_edge43.us._crit_edge
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %47) #5
  br label %._crit_edge43.us

._crit_edge43.us:                                 ; preds = %._crit_edge43.us._crit_edge, %46
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %indvars.iv
  %50 = load double, double* %49, align 8
  %51 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %50) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge43.us._crit_edge, label %._crit_edge45.us

._crit_edge45.us:                                 ; preds = %._crit_edge43.us
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond70 = icmp ne i64 %indvars.iv.next59, 1000
  br i1 %exitcond70, label %.preheader.us, label %._crit_edge47

._crit_edge47:                                    ; preds = %._crit_edge45.us
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %53 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %52, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
