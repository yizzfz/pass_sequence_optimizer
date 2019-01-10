; ModuleID = 'B.ll'
source_filename = "jacobi-1d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.5 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.6 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readnone) local_unnamed_addr #0 {
min.iters.checked:
  %2 = tail call i8* @polybench_alloc_data(i64 80000, i32 8) #3
  %3 = tail call i8* @polybench_alloc_data(i64 80000, i32 8) #3
  %4 = bitcast i8* %2 to double*
  %5 = bitcast i8* %3 to double*
  %scevgep = getelementptr i8, i8* %2, i64 640000
  %scevgep1 = getelementptr i8, i8* %3, i64 640000
  %bound0 = icmp ult i8* %2, %scevgep1
  %bound1 = icmp ult i8* %3, %scevgep
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

scalar.ph.preheader:                              ; preds = %min.iters.checked
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %vec.ind2 = phi <2 x i32> [ %vec.ind.next3, %vector.body ], [ <i32 0, i32 1>, %vector.body.preheader ]
  %6 = sitofp <2 x i32> %vec.ind2 to <2 x double>
  %7 = fadd <2 x double> %6, <double 2.000000e+00, double 2.000000e+00>
  %8 = fdiv <2 x double> %7, <double 8.000000e+04, double 8.000000e+04>
  %9 = getelementptr inbounds double, double* %4, i64 %index
  %10 = bitcast double* %9 to <2 x double>*
  store <2 x double> %8, <2 x double>* %10, align 8, !tbaa !1, !alias.scope !5, !noalias !8
  %11 = fadd <2 x double> %6, <double 3.000000e+00, double 3.000000e+00>
  %12 = fdiv <2 x double> %11, <double 8.000000e+04, double 8.000000e+04>
  %13 = getelementptr inbounds double, double* %5, i64 %index
  %14 = bitcast double* %13 to <2 x double>*
  store <2 x double> %12, <2 x double>* %14, align 8, !tbaa !1, !alias.scope !8
  %index.next = add i64 %index, 2
  %vec.ind.next3 = add <2 x i32> %vec.ind2, <i32 2, i32 2>
  %15 = icmp eq i64 %index.next, 80000
  br i1 %15, label %init_array.exit.preheader.loopexit58, label %vector.body, !llvm.loop !10

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %16 = phi i64 [ %25, %scalar.ph ], [ 0, %scalar.ph.preheader ]
  %17 = trunc i64 %16 to i32
  %18 = sitofp i32 %17 to double
  %19 = fadd double %18, 2.000000e+00
  %20 = fdiv double %19, 8.000000e+04
  %21 = getelementptr inbounds double, double* %4, i64 %16
  store double %20, double* %21, align 8, !tbaa !1
  %22 = fadd double %18, 3.000000e+00
  %23 = fdiv double %22, 8.000000e+04
  %24 = getelementptr inbounds double, double* %5, i64 %16
  store double %23, double* %24, align 8, !tbaa !1
  %25 = add nuw nsw i64 %16, 1
  %26 = icmp eq i64 %25, 80000
  br i1 %26, label %init_array.exit.preheader.loopexit, label %scalar.ph, !llvm.loop !13

init_array.exit.preheader.loopexit:               ; preds = %scalar.ph
  br label %init_array.exit.preheader

init_array.exit.preheader.loopexit58:             ; preds = %vector.body
  br label %init_array.exit.preheader

init_array.exit.preheader:                        ; preds = %init_array.exit.preheader.loopexit58, %init_array.exit.preheader.loopexit
  %scevgep9 = getelementptr i8, i8* %2, i64 8
  %scevgep10 = getelementptr i8, i8* %2, i64 639992
  %scevgep11 = getelementptr i8, i8* %3, i64 640000
  %scevgep33 = getelementptr i8, i8* %3, i64 8
  %scevgep34 = getelementptr i8, i8* %3, i64 639992
  %scevgep35 = getelementptr i8, i8* %2, i64 640000
  %bound036 = icmp ult i8* %scevgep33, %scevgep35
  %bound137 = icmp ult i8* %2, %scevgep34
  %memcheck.conflict39 = and i1 %bound036, %bound137
  %bound012 = icmp ult i8* %scevgep9, %scevgep11
  %bound113 = icmp ult i8* %3, %scevgep10
  %memcheck.conflict15 = and i1 %bound012, %bound113
  br label %init_array.exit

init_array.exit:                                  ; preds = %init_array.exit.preheader, %.loopexit
  %27 = phi i32 [ %128, %.loopexit ], [ 0, %init_array.exit.preheader ]
  br i1 %memcheck.conflict39, label %scalar.ph30.preheader, label %vector.body28.preheader

vector.body28.preheader:                          ; preds = %init_array.exit
  br label %vector.body28

vector.body28:                                    ; preds = %vector.body28.preheader, %vector.body28
  %index42 = phi i64 [ %index.next43, %vector.body28 ], [ 0, %vector.body28.preheader ]
  %offset.idx46 = or i64 %index42, 1
  %28 = add nsw i64 %offset.idx46, -1
  %29 = getelementptr inbounds double, double* %4, i64 %28
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %30, align 8, !tbaa !1, !alias.scope !14
  %31 = getelementptr double, double* %29, i64 2
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %32, align 8, !tbaa !1, !alias.scope !14
  %33 = getelementptr inbounds double, double* %4, i64 %offset.idx46
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %34, align 8, !tbaa !1, !alias.scope !14
  %35 = getelementptr double, double* %33, i64 2
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %36, align 8, !tbaa !1, !alias.scope !14
  %37 = fadd <2 x double> %wide.load51, %wide.load53
  %38 = fadd <2 x double> %wide.load52, %wide.load54
  %39 = add nuw nsw i64 %offset.idx46, 1
  %40 = getelementptr inbounds double, double* %4, i64 %39
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %41, align 8, !tbaa !1, !alias.scope !14
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %43, align 8, !tbaa !1, !alias.scope !14
  %44 = fadd <2 x double> %37, %wide.load55
  %45 = fadd <2 x double> %38, %wide.load56
  %46 = fmul <2 x double> %44, <double 3.333300e-01, double 3.333300e-01>
  %47 = fmul <2 x double> %45, <double 3.333300e-01, double 3.333300e-01>
  %48 = getelementptr inbounds double, double* %5, i64 %offset.idx46
  %49 = bitcast double* %48 to <2 x double>*
  store <2 x double> %46, <2 x double>* %49, align 8, !tbaa !1, !alias.scope !17, !noalias !14
  %50 = getelementptr double, double* %48, i64 2
  %51 = bitcast double* %50 to <2 x double>*
  store <2 x double> %47, <2 x double>* %51, align 8, !tbaa !1, !alias.scope !17, !noalias !14
  %index.next43 = add i64 %index42, 4
  %52 = icmp eq i64 %index.next43, 79996
  br i1 %52, label %scalar.ph30.preheader.loopexit, label %vector.body28, !llvm.loop !19

scalar.ph30.preheader.loopexit:                   ; preds = %vector.body28
  br label %scalar.ph30.preheader

scalar.ph30.preheader:                            ; preds = %scalar.ph30.preheader.loopexit, %init_array.exit
  %.ph57 = phi i64 [ 1, %init_array.exit ], [ 79997, %scalar.ph30.preheader.loopexit ]
  br i1 false, label %scalar.ph30.prol.preheader, label %scalar.ph30.prol.loopexit.unr-lcssa

scalar.ph30.prol.preheader:                       ; preds = %scalar.ph30.preheader
  br label %scalar.ph30.prol

scalar.ph30.prol:                                 ; preds = %scalar.ph30.prol.preheader
  br label %scalar.ph30.prol.loopexit.unr-lcssa

scalar.ph30.prol.loopexit.unr-lcssa:              ; preds = %scalar.ph30.preheader, %scalar.ph30.prol
  br label %scalar.ph30.prol.loopexit

scalar.ph30.prol.loopexit:                        ; preds = %scalar.ph30.prol.loopexit.unr-lcssa
  br i1 false, label %vector.memcheck16, label %scalar.ph30.preheader.new

scalar.ph30.preheader.new:                        ; preds = %scalar.ph30.prol.loopexit
  br label %scalar.ph30

scalar.ph30:                                      ; preds = %scalar.ph30, %scalar.ph30.preheader.new
  %53 = phi i64 [ %.ph57, %scalar.ph30.preheader.new ], [ %71, %scalar.ph30 ]
  %54 = add nsw i64 %53, -1
  %55 = getelementptr inbounds double, double* %4, i64 %54
  %56 = load double, double* %55, align 8, !tbaa !1
  %57 = getelementptr inbounds double, double* %4, i64 %53
  %58 = load double, double* %57, align 8, !tbaa !1
  %59 = fadd double %56, %58
  %60 = add nuw nsw i64 %53, 1
  %61 = getelementptr inbounds double, double* %4, i64 %60
  %62 = load double, double* %61, align 8, !tbaa !1
  %63 = fadd double %59, %62
  %64 = fmul double %63, 3.333300e-01
  %65 = getelementptr inbounds double, double* %5, i64 %53
  store double %64, double* %65, align 8, !tbaa !1
  %66 = getelementptr inbounds double, double* %4, i64 %53
  %67 = load double, double* %66, align 8, !tbaa !1
  %68 = getelementptr inbounds double, double* %4, i64 %60
  %69 = load double, double* %68, align 8, !tbaa !1
  %70 = fadd double %67, %69
  %71 = add nsw i64 %53, 2
  %72 = getelementptr inbounds double, double* %4, i64 %71
  %73 = load double, double* %72, align 8, !tbaa !1
  %74 = fadd double %70, %73
  %75 = fmul double %74, 3.333300e-01
  %76 = getelementptr inbounds double, double* %5, i64 %60
  store double %75, double* %76, align 8, !tbaa !1
  %77 = icmp eq i64 %71, 79999
  br i1 %77, label %vector.memcheck16.unr-lcssa, label %scalar.ph30, !llvm.loop !20

vector.memcheck16.unr-lcssa:                      ; preds = %scalar.ph30
  br label %vector.memcheck16

vector.memcheck16:                                ; preds = %scalar.ph30.prol.loopexit, %vector.memcheck16.unr-lcssa
  br i1 %memcheck.conflict15, label %.preheader.i.preheader, label %vector.body4.preheader

vector.body4.preheader:                           ; preds = %vector.memcheck16
  br label %vector.body4

vector.body4:                                     ; preds = %vector.body4.preheader, %vector.body4
  %index18 = phi i64 [ %index.next19, %vector.body4 ], [ 0, %vector.body4.preheader ]
  %offset.idx = or i64 %index18, 1
  %78 = add nsw i64 %offset.idx, -1
  %79 = getelementptr inbounds double, double* %5, i64 %78
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %80, align 8, !tbaa !1, !alias.scope !21
  %81 = getelementptr double, double* %79, i64 2
  %82 = bitcast double* %81 to <2 x double>*
  %wide.load23 = load <2 x double>, <2 x double>* %82, align 8, !tbaa !1, !alias.scope !21
  %83 = getelementptr inbounds double, double* %5, i64 %offset.idx
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load24 = load <2 x double>, <2 x double>* %84, align 8, !tbaa !1, !alias.scope !21
  %85 = getelementptr double, double* %83, i64 2
  %86 = bitcast double* %85 to <2 x double>*
  %wide.load25 = load <2 x double>, <2 x double>* %86, align 8, !tbaa !1, !alias.scope !21
  %87 = fadd <2 x double> %wide.load, %wide.load24
  %88 = fadd <2 x double> %wide.load23, %wide.load25
  %89 = add nuw nsw i64 %offset.idx, 1
  %90 = getelementptr inbounds double, double* %5, i64 %89
  %91 = bitcast double* %90 to <2 x double>*
  %wide.load26 = load <2 x double>, <2 x double>* %91, align 8, !tbaa !1, !alias.scope !21
  %92 = getelementptr double, double* %90, i64 2
  %93 = bitcast double* %92 to <2 x double>*
  %wide.load27 = load <2 x double>, <2 x double>* %93, align 8, !tbaa !1, !alias.scope !21
  %94 = fadd <2 x double> %87, %wide.load26
  %95 = fadd <2 x double> %88, %wide.load27
  %96 = fmul <2 x double> %94, <double 3.333300e-01, double 3.333300e-01>
  %97 = fmul <2 x double> %95, <double 3.333300e-01, double 3.333300e-01>
  %98 = getelementptr inbounds double, double* %4, i64 %offset.idx
  %99 = bitcast double* %98 to <2 x double>*
  store <2 x double> %96, <2 x double>* %99, align 8, !tbaa !1, !alias.scope !24, !noalias !21
  %100 = getelementptr double, double* %98, i64 2
  %101 = bitcast double* %100 to <2 x double>*
  store <2 x double> %97, <2 x double>* %101, align 8, !tbaa !1, !alias.scope !24, !noalias !21
  %index.next19 = add i64 %index18, 4
  %102 = icmp eq i64 %index.next19, 79996
  br i1 %102, label %.preheader.i.preheader.loopexit, label %vector.body4, !llvm.loop !26

.preheader.i.preheader.loopexit:                  ; preds = %vector.body4
  br label %.preheader.i.preheader

.preheader.i.preheader:                           ; preds = %.preheader.i.preheader.loopexit, %vector.memcheck16
  %.ph = phi i64 [ 1, %vector.memcheck16 ], [ 79997, %.preheader.i.preheader.loopexit ]
  br i1 false, label %.preheader.i.prol.preheader, label %.preheader.i.prol.loopexit.unr-lcssa

.preheader.i.prol.preheader:                      ; preds = %.preheader.i.preheader
  br label %.preheader.i.prol

.preheader.i.prol:                                ; preds = %.preheader.i.prol.preheader
  br label %.preheader.i.prol.loopexit.unr-lcssa

.preheader.i.prol.loopexit.unr-lcssa:             ; preds = %.preheader.i.preheader, %.preheader.i.prol
  br label %.preheader.i.prol.loopexit

.preheader.i.prol.loopexit:                       ; preds = %.preheader.i.prol.loopexit.unr-lcssa
  br i1 false, label %.loopexit, label %.preheader.i.preheader.new

.preheader.i.preheader.new:                       ; preds = %.preheader.i.prol.loopexit
  br label %.preheader.i

.preheader.i:                                     ; preds = %.preheader.i, %.preheader.i.preheader.new
  %103 = phi i64 [ %.ph, %.preheader.i.preheader.new ], [ %121, %.preheader.i ]
  %104 = add nsw i64 %103, -1
  %105 = getelementptr inbounds double, double* %5, i64 %104
  %106 = load double, double* %105, align 8, !tbaa !1
  %107 = getelementptr inbounds double, double* %5, i64 %103
  %108 = load double, double* %107, align 8, !tbaa !1
  %109 = fadd double %106, %108
  %110 = add nuw nsw i64 %103, 1
  %111 = getelementptr inbounds double, double* %5, i64 %110
  %112 = load double, double* %111, align 8, !tbaa !1
  %113 = fadd double %109, %112
  %114 = fmul double %113, 3.333300e-01
  %115 = getelementptr inbounds double, double* %4, i64 %103
  store double %114, double* %115, align 8, !tbaa !1
  %116 = getelementptr inbounds double, double* %5, i64 %103
  %117 = load double, double* %116, align 8, !tbaa !1
  %118 = getelementptr inbounds double, double* %5, i64 %110
  %119 = load double, double* %118, align 8, !tbaa !1
  %120 = fadd double %117, %119
  %121 = add nsw i64 %103, 2
  %122 = getelementptr inbounds double, double* %5, i64 %121
  %123 = load double, double* %122, align 8, !tbaa !1
  %124 = fadd double %120, %123
  %125 = fmul double %124, 3.333300e-01
  %126 = getelementptr inbounds double, double* %4, i64 %110
  store double %125, double* %126, align 8, !tbaa !1
  %127 = icmp eq i64 %121, 79999
  br i1 %127, label %.loopexit.unr-lcssa, label %.preheader.i, !llvm.loop !27

.loopexit.unr-lcssa:                              ; preds = %.preheader.i
  br label %.loopexit

.loopexit:                                        ; preds = %.preheader.i.prol.loopexit, %.loopexit.unr-lcssa
  %128 = add nuw nsw i32 %27, 1
  %129 = icmp eq i32 %128, 15000
  br i1 %129, label %kernel_jacobi_1d.exit, label %init_array.exit

kernel_jacobi_1d.exit:                            ; preds = %.loopexit
  %130 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !28
  %131 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %130) #4
  %132 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !28
  %133 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %132, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)) #4
  br label %134

; <label>:134:                                    ; preds = %142, %kernel_jacobi_1d.exit
  %135 = phi i64 [ 0, %kernel_jacobi_1d.exit ], [ %147, %142 ]
  %136 = trunc i64 %135 to i32
  %137 = srem i32 %136, 20
  %138 = icmp eq i32 %137, 0
  br i1 %138, label %139, label %142

; <label>:139:                                    ; preds = %134
  %140 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !28
  %141 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %140) #4
  br label %142

; <label>:142:                                    ; preds = %139, %134
  %143 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !28
  %144 = getelementptr inbounds double, double* %4, i64 %135
  %145 = load double, double* %144, align 8, !tbaa !1
  %146 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %143, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %145) #4
  %147 = add nuw nsw i64 %135, 1
  %148 = icmp eq i64 %147, 80000
  br i1 %148, label %print_array.exit, label %134

print_array.exit:                                 ; preds = %142
  %149 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !28
  %150 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %149, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)) #4
  %151 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !28
  %152 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.6, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %151) #4
  tail call void @free(i8* nonnull %2) #3
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.1 (tags/RELEASE_401/final)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"double", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6}
!6 = distinct !{!6, !7}
!7 = distinct !{!7, !"LVerDomain"}
!8 = !{!9}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !11, !12}
!11 = !{!"llvm.loop.vectorize.width", i32 1}
!12 = !{!"llvm.loop.interleave.count", i32 1}
!13 = distinct !{!13, !11, !12}
!14 = !{!15}
!15 = distinct !{!15, !16}
!16 = distinct !{!16, !"LVerDomain"}
!17 = !{!18}
!18 = distinct !{!18, !16}
!19 = distinct !{!19, !11, !12}
!20 = distinct !{!20, !11, !12}
!21 = !{!22}
!22 = distinct !{!22, !23}
!23 = distinct !{!23, !"LVerDomain"}
!24 = !{!25}
!25 = distinct !{!25, !23}
!26 = distinct !{!26, !11, !12}
!27 = distinct !{!27, !11, !12}
!28 = !{!29, !29, i64 0}
!29 = !{!"any pointer", !3, i64 0}
